part of 'imports.dart';

class GroupDetailVM extends ChangeNotifier {
  late GroupModel group;
  bool isLoading = false;
  List<StudentModel> students = [];
  final mask = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  TextEditingController search = TextEditingController();

  GroupDetailVM({
    required this.group,
  }) {
    init();
  }

  void init() async {
    _();
    for (var i in group.students) {
      students.add(await fb.specialStudent(i));
    }
    students.sort((a, b) => a.name.compareTo(b.name));
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
