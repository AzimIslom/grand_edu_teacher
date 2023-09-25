part of 'imports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileVM>(
      create: (_) => ProfileVM(),
      child: Consumer<ProfileVM>(
        builder: (context, ProfileVM vm, _) {
          return Scaffold(
            body: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Tel(
                            tel: vm.mask.maskText(vm.teacher.tel),
                          ),
                          const Divider(color: kPrimaryColor),
                          _Fullname(
                            fullname:
                                "${vm.teacher.name} ${vm.teacher.surname}",
                          ),
                          const Divider(color: kPrimaryColor),
                          _Groups(groups: vm.teacher.groups.length),
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
