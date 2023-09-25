part of 'imports.dart';

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTableVM>(
      builder: (context, AddTableVM vm, _) {
        return Text(
          vm.info(),
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}

class _Status extends StatelessWidget {
  const _Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTableVM>(
      builder: (context, AddTableVM vm, _) {
        return Column(
          children: [
            Text(
              lan(t.status),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [t.here, t.notHere, t.haveReason]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6),
                        onTap: () {
                          vm.selectStatus(e);
                        },
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 7.5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: vm.status != e
                                ? kPrimaryLightColor
                                : kPrimaryColor,
                          ),
                          child: Text(
                            lan(e),
                            style: TextStyle(
                              fontSize: 15,
                              color: vm.status == e
                                  ? kPrimaryLightColor
                                  : kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTableVM>(
      builder: (context, AddTableVM vm, _) {
        return Column(
          children: [
            Text(
              lan(t.active),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 0,
                glowColor: kPrimaryLightColor.withOpacity(.5),
                minRating: 1,
                unratedColor: kPrimaryLightColor,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, _) => Image.asset(
                  "assets/icons/star.png",
                  height: 20,
                ),
                onRatingUpdate: vm.selectStars,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTableVM>(
      builder: (context, AddTableVM vm, _) {
        return TextField(
          controller: vm.comment,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
          autocorrect: false,
          cursorColor: kPrimaryColor,
          onChanged: (a) {
            vm.notifyListeners();
          },
          maxLength: vm.comment.text.length <= 450 ? null : 500,
          maxLines: null,
          decoration: InputDecoration(
            hintText: lan(t.comment),
          ),
        );
      },
    );
  }
}

class _Next extends StatelessWidget {
  const _Next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTableVM>(
      builder: (context, AddTableVM vm, _) {
        final n = vm.canNext;
        return ElevatedButton(
          onPressed: () {
            vm.next(context);
          },
          child: Text(
            n ? lan(t.next) : lan(t.finish),
            style: const TextStyle(
              color: kPrimaryLightColor,
              fontSize: 17.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      },
    );
  }
}

class _Errors extends StatelessWidget {
  const _Errors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTableVM>(
      builder: (context, AddTableVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: vm.errors
              .map(
                (e) => Text(
                  "- ${lan(e)}",
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
