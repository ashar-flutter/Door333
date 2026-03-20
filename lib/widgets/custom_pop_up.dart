import '../config/barrel.dart';

Future<void> showCustomPopup(
    BuildContext context, {
      required String title,
      required String message,
      required String buttonText,
      required VoidCallback onButton,
      IconData icon = Icons.check,
      String? backLabel,
      VoidCallback? onBack,
      bool slideFromRight = false,
    }) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: const Color(0xB3000000),
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (_, _, _) => const SizedBox.shrink(),
    transitionBuilder: (context, anim, _, _) {
      final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutBack);
      final slide = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
          .animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic));

      Widget child = Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (backLabel != null)
                      onPress(
                        onTap: onBack ?? () => Navigator.pop(context),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, size: 2.h, color: AppColors.lightText),
                            SizedBox(width: 1.w),
                            customText(backLabel, fontSize: 16.sp, color: AppColors.titleColor),
                          ],
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    onPress(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, size: 2.3.h, color: AppColors.lightText),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                customText(title, fontSize: 16.4.sp, fontWeight: FontWeight.w400, textAlign: TextAlign.center, color: AppColors.titleColor),
                SizedBox(height: 3.h),
                Container(
                  height: 10.h, width: 10.h,
                  decoration: BoxDecoration(color: AppColors.lightGreen, shape: BoxShape.circle),
                  child: Center(child: Icon(icon, color: AppColors.green, size: 4.h)),
                ),
                SizedBox(height: 3.2.h),
                customText(message, fontSize: 17.sp, color: AppColors.titleColor, fontWeight: FontWeight.w400, textAlign: TextAlign.center),
                SizedBox(height: 3.2.h),
                customButton(buttonText, onButton, textColor: Colors.white),
              ],
            ),
          ),
        ),
      );

      return slideFromRight
          ? SlideTransition(position: slide, child: child)
          : ScaleTransition(scale: curved, child: FadeTransition(opacity: anim, child: child));
    },
  );
}