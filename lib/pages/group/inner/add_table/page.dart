part of 'imports.dart';

class AddTablePage extends StatelessWidget {
  final List<StudentModel> students;
  final GroupModel group;

  const AddTablePage({
    Key? key,
    required this.students,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddTableVM>(
      create: (_) => AddTableVM(
        students: students,
        group: group,
      ),
      child: Consumer<AddTableVM>(
        builder: (context, AddTableVM vm, _) {
          return Scaffold(
            backgroundColor: c.white,
            body: Stack(
              children: [
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        _Info(),
                        SizedBox(height: 15),
                        _Status(),
                        SizedBox(height: 15),
                        _Rating(),
                        SizedBox(height: 15),
                        _Field(),
                        SizedBox(height: 15),
                        _Next(),
                        SizedBox(height: 15),
                        _Errors(),
                      ],
                    ),
                  ),
                ),
                vm.isLoading
                    ? Container(
                        alignment: Alignment.center,
                        color: kPrimaryColor.withOpacity(.7),
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: kPrimaryLightColor,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
