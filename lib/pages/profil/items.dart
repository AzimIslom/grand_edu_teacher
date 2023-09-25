part of 'imports.dart';

class _Tel extends StatelessWidget {
  final String tel;

  const _Tel({Key? key, required this.tel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lan(t.tel),
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          tel,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _Fullname extends StatelessWidget {
  final String fullname;

  const _Fullname({
    Key? key,
    required this.fullname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lan(t.fullname2),
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          fullname,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _Groups extends StatelessWidget {
  final int groups;

  const _Groups({
    Key? key,
    required this.groups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$groups ${lan(t.groups2)}",
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
