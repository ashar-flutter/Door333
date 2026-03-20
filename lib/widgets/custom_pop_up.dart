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
  bool showIcon = false,
  Widget? customContent,
  String? extraButton,
  VoidCallback? onExtra,
  Color buttonColor = AppColors.primary,
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
      final slide = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic));

      Widget child = Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close / back row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (backLabel != null)
                      onPress(
                        onTap: onBack ?? () => Navigator.pop(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 2.h,
                              color: AppColors.lightText,
                            ),
                            SizedBox(width: 1.w),
                            customText(
                              backLabel,
                              fontSize: 16.sp,
                              color: AppColors.titleColor,
                            ),
                          ],
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    onPress(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        size: 2.3.h,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),

                // Title
                Center(
                  child: customText(
                    title,
                    fontSize: 17.5.sp,
                    fontWeight: FontWeight.w900,
                    textAlign: TextAlign.center,
                    color: AppColors.titleColor,
                  ),
                ),
                SizedBox(height: 2.h),

                // Icon circle — only when showIcon is true
                if (showIcon && customContent == null) ...[
                  Center(
                    child: Container(
                      height: 11.h,
                      width: 11.h,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImage.check,
                          height: 4.2.h,
                          width: 4.2.h,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],

                // Message
                Center(
                  child: customText(
                    message,
                    fontSize: 16.3.sp,
                    color: AppColors.titleColor,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4.6.h),

                if (customContent != null) ...[customContent],

                // Primary button
                customButton(
                  height: 6,
                  buttonText,
                  onButton,
                  textColor: Colors.white,
                  backgroundColor: buttonColor,
                  borderColor: buttonColor,
                ),

                // Extra button
                if (extraButton != null) ...[
                  SizedBox(height: 1.5.h),
                  customButton(
                    height: 6,

                    extraButton,
                    onExtra ?? () => Navigator.pop(context),
                    backgroundColor: Colors.white,
                    textColor: AppColors.primary,
                    borderColor: Colors.grey.shade300,
                  ),
                ],
              ],
            ),
          ),
        ),
      );

      return slideFromRight
          ? SlideTransition(position: slide, child: child)
          : ScaleTransition(
              scale: curved,
              child: FadeTransition(opacity: anim, child: child),
            );
    },
  );
}
