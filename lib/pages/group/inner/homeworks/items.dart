part of 'imports.dart';

AppBar _appBar(
  BuildContext context,
) =>
    AppBar(
      backgroundColor: kPrimaryLightColor,
      leading: IconButton(
        splashRadius: 25,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          CupertinoIcons.chevron_left,
          color: kPrimaryColor,
          size: 27,
        ),
      ),
      title: SizedBox(
        height: 50,
        width: 310,
        child: Builder(builder: (context) {
          return Consumer<HomeworksVM>(
            builder: (context, HomeworksVM vm, _) {
              return DropdownButton<int>(
                isExpanded: true,
                dropdownColor: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(12),
                value: vm.current,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: kPrimaryColor,
                ),
                hint: Text(
                  "${vm.current}-${lan(t.unit2)}",
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
                onChanged: (val) {
                  if (val == null) return;
                  vm.unit(val);
                },
                items: List.generate(vm.group.unit, (index) => index)
                    .reversed
                    .map<DropdownMenuItem<int>>((int value) {
                  value++;
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      "$value-${lan(t.unit2)}",
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
  final HomeworkModel hw;
  final StudentModel stu;
  final int unit;

  const _Item(
      {Key? key, required this.hw, required this.stu, required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = hw.units
        .firstWhere(
          (element) => element.unit == unit,
          orElse: () => HWStatsModel(unit: unit, percent: 0),
        )
        .percent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            "${stu.name} ${stu.surname}",
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          CircularPercentIndicator(
            animation: true,
            radius: 20,
            circularStrokeCap: CircularStrokeCap.round,
            lineWidth: 3,
            percent: p / 100,
            center: Text(
              "$p",
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: c.white,
            progressColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
