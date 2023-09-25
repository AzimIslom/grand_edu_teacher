part of 'imports.dart';

class HomeworksPage extends StatelessWidget {
  final GroupModel group;

  const HomeworksPage({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeworksVM>(
      create: (_) => HomeworksVM(group),
      child: Consumer<HomeworksVM>(
        builder: (context, HomeworksVM vm, _) {
          return Scaffold(
            appBar: _appBar(context),
            body: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: kPrimaryColor),
                  )
                : SafeArea(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: vm.hw.length,
                      itemBuilder: (_, int index) {
                        final hw = vm.hw[index];
                        final stu = vm.students
                            .firstWhere((element) => hw.tel == element.tel);
                        return _Item(
                          hw: hw,
                          stu: stu,
                          unit: vm.current,
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
