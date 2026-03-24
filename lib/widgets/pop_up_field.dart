import '../config/barrel.dart';

Widget popUpField(
    String hintText, {
      double? height,
      TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      TextInputAction textInputAction = TextInputAction.next,
      int maxLines = 1,
      bool obSecure = false,
      bool enabled = true,
      double fontSize = 14.9,
      Color hintColor = AppColors.lightText,
      Color focusBorderColor = AppColors.primary,
      Function(String)? onChanged,
      bool autofocus = false,
      TextAlign textAlign = TextAlign.left,
      IconData? prefixIcon,
      IconData? suffixIcon,
      VoidCallback? onSuffixTap,
    }) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        height: height ?? (maxLines > 1 ? (5.h + (maxLines - 1) * 1.5.h) : 5.h),
        child: TextField(
          controller: controller,
          enabled: enabled,
          textAlign: textAlign,
          autofocus: autofocus,
          maxLines: maxLines,
          obscureText: obSecure,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onChanged: onChanged,
          style: TextStyle(
            fontFamily: 'Helix',
            color: AppColors.titleColor,
            fontSize: fontSize.sp,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            filled: false,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: maxLines > 1 ? 1.5.h : 1.h,
            ),
            hintStyle: TextStyle(
              fontFamily: 'Helix',
              fontSize: fontSize.sp,
              color: hintColor,
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
              padding: EdgeInsets.only(left: 4.w, right: 2.w),
              child: Icon(
                prefixIcon,
                color: AppColors.primary,
                size: 2.2.h,
              ),
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
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: const Color(0xFFE2E8F0), width: 1.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: focusBorderColor, width: 1.5),
            ),
          ),
        ),
      );
    },
  );
}