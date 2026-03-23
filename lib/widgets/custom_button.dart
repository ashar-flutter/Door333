import '../config/barrel.dart';

enum IconPosition { start, end }

Widget customButton(
  String text,
  Function onTap, {
  double height = 7,
  double fontSize = 14.8,
  double width = 100,
  Color backgroundColor = AppColors.primary,
  Color textColor = AppColors.lightText,
  Color borderColor = AppColors.primary,
  double borderRadius = 18,
  IconData? icon,
  IconPosition iconPosition = IconPosition.start,
}) {
  return SizedBox(
    height: height.h,
    width: width.w,
    child: onPress(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
          border: Border.all(color: borderColor,width: 1.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && iconPosition == IconPosition.start) ...[
              Icon(icon, color: textColor),
              SizedBox(width: 2.w),
            ],
            customText(
              text,
              color: textColor,
              fontWeight: FontWeight.w800,
              fontSize: fontSize,
            ),
            if (icon != null && iconPosition == IconPosition.end) ...[
              SizedBox(width: 3.w),
              Icon(icon, color: textColor,
              size: 17,
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
