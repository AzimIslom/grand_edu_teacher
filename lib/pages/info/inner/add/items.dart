part of 'imports.dart';

class _Field extends StatelessWidget {
  const _Field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddThemeVM>(
      builder: (context, AddThemeVM vm, _) {
        return TextField(
          onChanged: (a) {
            vm.notifyListeners();
          },
          maxLength: vm.txt.text.length > 50 ? 70 : null,
          controller: vm.txt,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
          cursorColor: kPrimaryColor,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: lan(t.nameTheme),
          ),
        );
      },
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddThemeVM>(
      builder: (context, AddThemeVM vm, _) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                vm.save(context);
              },
              child: Text(
                lan(t.save),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryLightColor,
              ),
              child: Text(
                lan(t.back),
                style: const TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
