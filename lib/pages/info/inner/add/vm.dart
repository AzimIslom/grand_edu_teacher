part of 'imports.dart';

class AddThemeVM extends ChangeNotifier {
  final int unit;
  TextEditingController txt = TextEditingController();
  bool isLoading = false;

  AddThemeVM({required this.unit});

  void save(BuildContext context) async {
    _();
    if (txt.text.trim().length < 5) {
      {
        FocusManager.instance.primaryFocus?.unfocus();
        if ((await Vibration.hasCustomVibrationsSupport()) == true) {
          Vibration.vibrate(duration: 1000);
        } else {
          Vibration.vibrate();
          await Future.delayed(const Duration(milliseconds: 500));
          Vibration.vibrate();
        }
        notifyListeners();
      }
    } else {
      _();
      final theme = ThemeModel(unit: unit, title: txt.text.trim());
      // await fb.addTheme(theme);
      _();
      Navigator.pop(context, 'dndoew');
    }
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
