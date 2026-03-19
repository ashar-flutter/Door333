import 'barrel.dart';

Widget onPress({Function? onTap, Widget? child, Key? key}) {
  return InkWell(
    key: key,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();
      if (onTap != null) {
        onTap();
      }
    },
    child: child,
  );
}
