part of 'imports.dart';

class InfoVM extends ChangeNotifier {
  List<ThemeModel> themes = [];
  TextEditingController search = TextEditingController();
  bool isLoading = false;

  InfoVM() {
    search.addListener(() {
      notifyListeners();
    });
    init();
  }

  void init() async {
    _();
    themes = [];
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
