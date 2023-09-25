part of 'imports.dart';

class StudentVM extends ChangeNotifier {
  TextEditingController search = TextEditingController();
  List<GroupModel> groups = [];
  List<StudentModel> students = [];
  bool isLoading = false;
  final mask = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  StudentVM() {
    search.addListener(() {
      notifyListeners();
    });
    init();
  }

  void init() async {
    _();
    groups = await fb.speGroup(auth.tel);
    for (var group in groups) {
      for (var student in group.students) {
        students.add(await fb.specialStudent(student));
      }
    }
    students.sort((a, b) => a.name.compareTo(b.name));
    _();
  }

  GroupModel speGroup(String id) =>
      groups.firstWhere((element) => element.id == id);

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
