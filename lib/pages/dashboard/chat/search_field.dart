import '../../../config/barrel.dart';

Widget searchField({
  required String hintText,
  Color? fillColor,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    height: 5.9.h,
    width: double.infinity,
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? const Color(0xFFE2E8F0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 22, right: 8),
          child: SizedBox(
            height: 1.2.h,
            width: 1.2.h,
            child: Image.asset(
              AppImage.search,
              fit: BoxFit.contain,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(bottom: 2),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15.sp,
          color: AppColors.hintText,
          fontFamily: "Helix",
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 1.8,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
      ),
    ),
  );
}