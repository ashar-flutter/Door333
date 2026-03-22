import '../config/barrel.dart';

Widget textField(
    String hintText, {
      TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      TextInputAction textInputAction = TextInputAction.next,
      int line = 1,
      bool obSecure = false,
      bool enable = true,
      double radius = 16,
      double fontSize = 15.5,
      Color fillColor = Colors.white,
      Color enableBorderColor = AppColors.lightText,
      Color focusBorderColor = AppColors.primary,
      Function(String)? onChanged,
      bool autofocus = false,
      TextAlign textAlign = TextAlign.left,
      IconData? prefixIcon,
      IconData? suffixIcon,
      Function()? onSuffixTap,
    }) {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return TextField(
        controller: controller,
        enabled: enable,
        textAlign: textAlign,
        autofocus: autofocus,
        maxLines: line,
        obscureText: obSecure,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        style: TextStyle(
            fontFamily: 'Hellix',
            color: AppColors.titleColor,
            fontSize: fontSize.sp
        ),
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          prefixIcon: prefixIcon != null
              ? Padding(
            padding: EdgeInsets.only(left: 4.w, right: 2.w),
            child: Icon(prefixIcon, color: AppColors.primary, size: 2.2.h),
          )
              : null,
          suffixIcon: suffixIcon != null
              ? Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: onPress(
              onTap: onSuffixTap ?? () {},
              child: Icon(
                suffixIcon,
                color: AppColors.primary,
                size: 2.2.h,
              ),
            ),
          )
              : (keyboardType == TextInputType.visiblePassword
              ? Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: onPress(
              onTap: () {
                setState(() {
                  obSecure = !obSecure;
                });
              },
              child: Icon(
                obSecure ? Icons.visibility_off : Icons.visibility,
                size: 2.3.h,
                color: obSecure ? AppColors.lightText : AppColors.primary,
              ),
            ),
          )
              : null),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 2.h,
          ),
          hintStyle: TextStyle(
            fontFamily: 'Hellix',
            fontSize: fontSize.sp,
            color: Colors.grey.shade400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: enableBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: focusBorderColor, width: 1.5),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: AppColors.lightText),
          ),
        ),
      );
    },
  );
}