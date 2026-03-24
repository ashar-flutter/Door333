import '../config/barrel.dart';

Widget customText(
    String text, {
      Function? onTap,
      Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      int? maxLines,
      double? letterSpacing,
      FontStyle? fontStyle,
      EdgeInsetsGeometry padding = EdgeInsets.zero,
      TextAlign textAlign = TextAlign.left,
      double? wordSpacing,
      TextDecoration decoration = TextDecoration.none,
    }) {
  return AbsorbPointer(
    absorbing: onTap == null,
    child: onPress(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: 'Helix',
            fontSize: fontSize?.sp ?? 16.sp,
            fontStyle: fontStyle,
            color: color ?? AppColors.titleColor,
            fontWeight: fontWeight ?? FontWeight.w400,
            letterSpacing: letterSpacing,
            decoration: decoration,
            wordSpacing: wordSpacing,
            decorationColor:AppColors.primary,
          ),
        ),
      ),
    ),
  );
}