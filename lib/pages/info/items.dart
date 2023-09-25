part of 'imports.dart';

AppBar _appBar(
  BuildContext context,
  int unit,
  VoidCallback onBack,
) {
  return AppBar(
    backgroundColor: kPrimaryLightColor,
    title: Text(
      lan(t.themes),
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        splashRadius: 25,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: AddThemePage(unit: unit),
              type: PageTransitionType.rightToLeft,
            ),
          ).then((value) {
            if (value == null) return;
            onBack();
          });
        },
        icon: const Icon(
          CupertinoIcons.add,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
      const SizedBox(width: 10),
    ],
  );
}

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoVM>(
      builder: (context, InfoVM vm, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              Expanded(
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
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final ThemeModel theme;

  const _Item({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Text(
          theme.unit.toString(),
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        title: Text(
          theme.title,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          CupertinoIcons.chevron_right,
          color: kPrimaryColor,
          size: 27,
        ),
      ),
    );
  }
}
