part of 'imports.dart';

class TablePage extends StatelessWidget {
  final GroupModel group;

  const TablePage({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableVM>(
      create: (_) => TableVM(group: group),
      child: Consumer<TableVM>(
        builder: (context, TableVM vm, _) {
          return Scaffold(
            appBar: _appBar(context, group, vm.canAdd, vm.students, vm.init),
            body: Container(
              padding: const EdgeInsets.all(10),
              child: vm.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  : vm.table.isNotEmpty
                      ? Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _Top(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.builder(
                                itemCount: vm.table.length,
                                itemBuilder: (_, int index) {
                                  final a = vm.table[index];
                                  final stu = vm.students.firstWhere((element) => a.student == element.tel);
                                  return _Item(attendance: a, stu: stu);
                                },
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   lan(t.noLessons),
                            //   style: const TextStyle(
                            //     color: kPrimaryColor,
                            //     fontWeight: FontWeight.w700,
                            //     fontSize: 25,
                            //   ),
                            //   textAlign: TextAlign.center,
                            // ),
                            vm.students.isNotEmpty
                                ? ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: AddTablePage(
                                            students: vm.students,
                                            group: group,
                                          ),
                                          type: PageTransitionType.rightToLeft,
                                        ),
                                      ).then((value) {
                                        vm.init();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: kPrimaryLightColor,
                                    ),
                                    child: Text(
                                      "${lan(t.nextLesson)}: ${group.unit + 1}-${lan(t.unit2)}",
                                      style: const TextStyle(
                                        color: kPrimaryLightColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : Column(
                                    children: [
                                      const Divider(color: kPrimaryColor),
                                      Text(
                                        lan(t.noStudent),
                                        style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                          ],
                        ),
            ),
          );
        },
      ),
    );
  }
}
