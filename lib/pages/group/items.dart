part of 'imports.dart';

AppBar _appBar(
  BuildContext context,
) =>
    AppBar(
      backgroundColor: kPrimaryLightColor,
      title: SizedBox(
        height: 50,
        width: 310,
        child: Builder(builder: (context) {
          return Consumer<GroupVM>(
            builder: (context, GroupVM vm, _) {
              return DropdownButton<String>(
                isExpanded: true,
                dropdownColor: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(12),
                value: vm.branch?.short,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: kPrimaryColor,
                ),
                hint: Text(
                  lan(t.allBranches),
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                elevation: 16,
                style: const TextStyle(
                  color: kPrimaryColor,
                ),
                underline: Container(
                  height: 1,
                  color: kPrimaryColor,
                ),
                onChanged: vm.select,
                items: vm.branches
                    .map<DropdownMenuItem<String>>((BranchModel value) {
                  return DropdownMenuItem<String>(
                    value: value.short,
                    child: Text(
                      value.short,
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          );
        }),
      ),
    );

class _Item extends StatelessWidget {
  final GroupModel group;

  const _Item({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupVM>(
      builder: (context, GroupVM vm, _) {
        return Hero(
          tag: "group.${group.id}",
          child: Card(
            color: kPrimaryLightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: GroupDetailPage(
                      group: group,
                    ),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              splashColor: c.white.withOpacity(.5),
              hoverColor: c.white,
              minLeadingWidth: 55,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat.Hm().format(group.start),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    lan(
                      group.odd ? t.odd : t.even,
                    ),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              title: Text(
                group.name,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                group.unit != 0
                    ? "${group.unit}-${lan(t.unit2)}"
                    : lan(t.firstLesson),
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
      },
    );
  }
}
