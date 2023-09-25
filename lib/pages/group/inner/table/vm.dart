part of 'imports.dart';

class TableVM extends ChangeNotifier {
  List<AttendanceModel> table = [];
  bool isLoading = false;
  List<StudentModel> students = [];
  late GroupModel group;
  int currTime = 0;

  TableVM({required this.group}) {
    init();
  }

  bool get canAdd {
    final List<String> times =
        group.lessons.map((e) => "${e.year}${e.month}${e.day}").toList();
    final curr = DateTime.now();
    final time = "${curr.year}${curr.month}${curr.day}";
    return students.isNotEmpty &&
        group.lessons.isNotEmpty &&
        !times.contains(time);
  }

  void next() async {
    _();
    currTime++;
    table = group.lessons.isEmpty ? [] : await fb.attendance(group, currTime);
    _();
  }

  void prev() async {
    _();
    currTime--;
    table = group.lessons.isEmpty ? [] : await fb.attendance(group, currTime);
    _();
  }

  bool get canNext => currTime + 1 != group.lessons.length;

  bool get canPrev => currTime > 0;

  void init() async {
    _();
    students = [];
    for (var i in group.students) {
      students.add(await fb.specialStudent(i));
    }
    currTime = group.lessons.length - 1;
    table = group.lessons.isEmpty ? [] : await fb.attendance(group, currTime);
    _();
  }

  String fullname(String id) {
    final s = students.firstWhere((element) => element.tel == id);
    return "${s.name} ${s.surname}";
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
