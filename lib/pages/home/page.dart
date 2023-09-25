part of 'imports.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (_) => HomeVM(),
      child: Consumer<HomeVM>(
        builder: (context, HomeVM vm, _) {
          return Scaffold(
            backgroundColor: c.white,
            // appBar: AppBar(),
            body: [
              const GroupPage(),
              const StudentPage(),
              const SizedBox.shrink(),
              const InfoPage(),
              const ProfilePage(),
            ][vm.currentIndex],
            bottomNavigationBar: const _BNB(),
          );
        },
      ),
    );
  }
}
