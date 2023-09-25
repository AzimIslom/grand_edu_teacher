part of 'imports.dart';

class _BNB extends StatelessWidget {
  const _BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return FlashyTabBar(
          selectedIndex: vm.currentIndex,
          backgroundColor: kPrimaryLightColor,
          height: 55,
          showElevation: true,
          onItemSelected: vm.changeIndex,
          iconSize: 20,
          items: [
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/groups.png",
                height: 35,
              ),
              title: const Text('Guruh'),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/students.png",
                height: 35,
              ),
              title: const Text('O\'quvchi'),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/feedback.png",
                height: 35,
              ),
              title: const Text('Fkir'),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/data.png",
                height: 35,
              ),
              title: const Text('Ma\'lumot'),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/profile.png",
                height: 35,
              ),
              title: const Text('Profil'),
            ),
          ],
        );
      },
    );
  }
}
