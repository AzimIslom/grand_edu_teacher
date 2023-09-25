part of 'imports.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GroupVM>(
      create: (_) => GroupVM(),
      child: Consumer<GroupVM>(
        builder: (context, GroupVM vm, _) {
          return Scaffold(
            appBar: _appBar(context),
            backgroundColor: c.white,
            body: !vm.isLoading
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 15,
                    ),
                    itemCount: vm.groups.length,
                    itemBuilder: (_, int index) {
                      final teacher = vm.groups[index];
                      return _Item(group: teacher);
                    },
                  )
                : const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
