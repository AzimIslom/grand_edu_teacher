part of 'imports.dart';

class AddExpPage extends StatelessWidget {
  const AddExpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddExpVM>(
      create: (_) => AddExpVM(),
      child: Scaffold(
        backgroundColor: c.white,
      ),
    );
  }
}
