part of 'imports.dart';

class AddTableVM extends ChangeNotifier {
  final List<StudentModel> students;
  final GroupModel group;
  List<AttendanceModel> attendance = [];
  bool isLoading = false;
  int current = 0;
  String? status;
  int? stars;
  List<String> errors = [];
  TextEditingController comment = TextEditingController();
  final mask = MaskTextInputFormatter(
    mask: '## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  AddTableVM({
    required this.students,
    required this.group,
  });

  bool get canNext => students.length - 1 != current;

  void selectStatus(String res) {
    status = res;
    notifyListeners();
  }

  String info() {
    final s =
        students.firstWhere((element) => element.tel == students[current].tel);
    return "${s.name} ${s.surname}, ${mask.maskText(s.tel)}";
  }

  void selectStars(double stars) {
    this.stars = stars.toInt();
    notifyListeners();
  }

  void finish() {}

  void next(BuildContext context) async {
    errors = [];
    if (status == null) {
      errors.add(t.status);
    }
    if (stars == null) {
      errors.add(t.active);
    }
    if (comment.text.trim().length <= 3) {
      errors.add(t.comment);
    }
    if (errors.isEmpty) {
      final info = AttendanceModel(
        by: group.teacherId,
        des: [
          TableDesModel(
            des: comment.text.trim(),
            by: group.teacherId,
            time: DateTime.now(),
          ),
        ],
        time: DateTime.now(),
        student: students[current].tel,
        status: status == t.here
            ? true
            : status == t.notHere
                ? false
                : null,
        stars: stars!,
      );
      attendance.add(info);
      status = null;
      comment.clear();
      if (!canNext) {
        _();
        group.lessons.add(DateTime.now());
        await fb.updateGroup(group);
        await fb.addAttendance(attendance, group);
        _();
        Navigator.pop(context, 'ajbdi');
      } else {
        current++;
      }
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      if ((await Vibration.hasCustomVibrationsSupport()) == true) {
        Vibration.vibrate(duration: 1000);
      } else {
        Vibration.vibrate();
        await Future.delayed(const Duration(milliseconds: 500));
        Vibration.vibrate();
      }
    }
    notifyListeners();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
