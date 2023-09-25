part of 'imports.dart';

class AddThemePage extends StatelessWidget {
  final int unit;

  const AddThemePage({
    Key? key,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddThemeVM>(
      create: (_) => AddThemeVM(unit: unit),
      child: Consumer<AddThemeVM>(
        builder: (context, AddThemeVM vm, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Field(),
                          SizedBox(height: 20),
                          _Buttons(),
                          SizedBox(height: 200),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
