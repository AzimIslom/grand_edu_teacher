part of 'imports.dart';

class HomeworksVM extends ChangeNotifier {
  final GroupModel group;
  int current = 0;
  bool isLoading = false;
  List<HomeworkModel> hw = [];
  List<StudentModel> students = [];

  HomeworksVM(this.group) {
    init();
  }

  void init() async {
    _();
    current = group.unit;
    hw = await fb.homeworks(group);
    for (var i in group.students) {
      students.add(await fb.specialStudent(i));
    }
    students.sort((a, b) => a.name.compareTo(b.name));
    _();
  }

  void unit(int unit) {
    current = unit;
    notifyListeners();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
