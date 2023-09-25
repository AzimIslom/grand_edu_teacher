part of 'imports.dart';

class GroupVM extends ChangeNotifier {
  BranchModel? branch;
  List<BranchModel> branches = [];
  bool isLoading = false;
  List<GroupModel> groups = [];

  GroupVM() {
    init();
  }

  Future<void> init() async {
    _();
    branches = await fb.branches();
    groups = await fb.speGroup(auth.tel);
    _();
  }

  void select(String? branch) {
    this.branch = branches.firstWhere((element) => element.short == branch);
    notifyListeners();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
