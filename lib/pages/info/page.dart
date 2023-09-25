part of 'imports.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InfoVM>(
      create: (_) => InfoVM(),
      child: Consumer<InfoVM>(
        builder: (context, InfoVM vm, _) {
          return Scaffold(
            backgroundColor: c.white,
            appBar: _appBar(context, vm.themes.length + 1, vm.init),
            body: vm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : Column(
                    children: [
                      const _Top(),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          itemBuilder: (_, int index) {
                            final theme = vm.themes[index];
                            final search = vm.search.text.toLowerCase().trim();
                            final name = theme.title;
                            final unit = theme.unit.toString();
                            return name.contains(search) ||
                                    unit.contains(search)
                                ? _Item(theme: theme)
                                : const SizedBox.shrink();
                          },
                          itemCount: vm.themes.length,
                        ),
                      ),
                    ],
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
            ),
          );
        },
      ),
    );
  }
}
