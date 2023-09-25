part of 'imports.dart';

class ProfileVM extends ChangeNotifier {
  bool isLoading = false;
  late TeacherModel teacher;

  final mask = MaskTextInputFormatter(
    mask: '## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  ProfileVM() {
    print("dnwe");
    init();
  }

  void init() async {
    _();
    teacher = await fb.currTeacher();
    print("djnoiwneno");
    print(teacher);
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
