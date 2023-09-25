part of 'imports.dart';

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentVM>(
      builder: (context, StudentVM vm, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: AnimSearchBar(
            rtl: true,
            searchIconColor: kPrimaryColor,
            textFieldIconColor: kPrimaryColor,
            textFieldColor: kPrimaryLightColor,
            color: kPrimaryLightColor,
            width: 400,
            autoFocus: true,
            textController: vm.search,
            onSuffixTap: () {},
            onSubmitted: (String) {},
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final StudentModel student;
  final MaskTextInputFormatter mask;
  final GroupModel group;

  const _Item({
    Key? key,
    required this.student,
    required this.mask,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "student.${student.tel}",
      child: Card(
        color: kPrimaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          minLeadingWidth: 10,
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: StudentDetailPage(
                  student: student,
                ),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
          splashColor: c.white.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hoverColor: c.white,
          title: Text(
            "${student.name} ${student.surname}, ${group.name}",
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            mask.maskText(student.tel),
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            CupertinoIcons.chevron_right,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
