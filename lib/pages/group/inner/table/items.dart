part of 'imports.dart';

AppBar _appBar(
  BuildContext context,
  GroupModel group,
  bool res,
  List<StudentModel> students,
  VoidCallback onBack,
) {
  return AppBar(
    backgroundColor: kPrimaryLightColor,
    title: Text(
      "${group.name}. ${lan(group.odd ? t.odd : t.even)}, ${DateFormat.Hm().format(group.start)}.",
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
    ),
    leading: IconButton(
      splashRadius: 25,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        CupertinoIcons.chevron_left,
        color: kPrimaryColor,
        size: 30,
      ),
    ),
    centerTitle: true,
    actions: res
        ? [
            IconButton(
              splashRadius: 25,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: AddTablePage(students: students, group: group),
                    type: PageTransitionType.rightToLeft,
                  ),
                ).then((value) {
                  if (value != null) {
                    onBack();
                  }
                });
              },
              icon: Image.asset(
                "assets/icons/present.png",
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
          ]
        : null,
  );
}

class _Item extends StatelessWidget {
  final StudentModel stu;
  final AttendanceModel attendance;

  const _Item({Key? key, required this.attendance, required this.stu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kPrimaryLightColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${stu.name} ${stu.surname},",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                stu.tel,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
              const Spacer(),
              Text(
                attendance.stars.toString(),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 2.5),
              Image.asset(
                "assets/icons/star.png",
                height: 25,
                color: kPrimaryColor,
              ),
              const SizedBox(width: 15),
              Image.asset(
                attendance.status == null
                    ? "assets/icons/minus.png"
                    : attendance.status == true
                        ? "assets/icons/present.png"
                        : "assets/icons/x.png",
                color: kPrimaryColor,
                height: 25,
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            attendance.des.first.des,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TableVM>(
      builder: (context, TableVM vm, _) {
        return Row(
          children: [
            IconButton(
              splashRadius: 20,
              onPressed: vm.canPrev ? vm.prev : null,
              icon: Icon(
                CupertinoIcons.chevron_left,
                color: vm.canPrev ? kPrimaryColor : kPrimaryLightColor,
                size: 25,
              ),
            ),
            Text(
              DateFormat.yMd().format(vm.group.lessons[vm.currTime]),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              splashRadius: 20,
              onPressed: vm.canNext ? vm.next : null,
              icon: Icon(
                CupertinoIcons.chevron_right,
                color: vm.canNext ? kPrimaryColor : kPrimaryLightColor,
                size: 25,
              ),
            ),
          ],
        );
      },
    );
  }
}
