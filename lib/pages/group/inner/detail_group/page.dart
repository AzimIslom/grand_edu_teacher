part of 'imports.dart';

class GroupDetailPage extends StatelessWidget {
  final GroupModel group;

  const GroupDetailPage({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GroupDetailVM>(
      create: (_) => GroupDetailVM(group: group),
      child: Scaffold(
        appBar: _appBar(context, group),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Consumer<GroupDetailVM>(
              builder: (context, GroupDetailVM vm, _) {
                return Column(
                  children: [
                    _Item(group: group),
                    const SizedBox(height: 10),
                    _Options(group: group),
                    const _Top(),
                    const SizedBox(height: 10),
                    Expanded(
                      child: vm.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                                bottom: 15,
                              ),
                              itemCount: vm.students.length,
                              itemBuilder: (_, int index) {
                                final student = vm.students[index];
                                final search = vm.search.text.toLowerCase();
                                final fullname =
                                    '${student.name} ${student.surname}'
                                        .toLowerCase();
                                final rev =
                                    '${student.surname} ${student.name}';
                                return fullname.contains(search) ||
                                        rev.contains(search) ||
                                        student.tel.contains(search)
                                    ? _Student(
                                        student: student,
                                        mask: vm.mask,
                                      )
                                    : const SizedBox.shrink();
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
