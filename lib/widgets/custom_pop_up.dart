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
    transitionBuilder: (ctx, anim, _, _) {
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
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (backLabel != null)
                      onPress(
                        onTap: onBack ?? () => Navigator.pop(ctx),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 2.3.h,
                              color: AppColors.titleColor,
                            ),
                            SizedBox(width: 2.w),
                            customText(
                              backLabel,
                              fontSize: 16.5.sp,
                              color: AppColors.lightText,
                            ),
                          ],
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    onPress(
                      onTap: () => Navigator.pop(ctx),
                      child: Icon(
                        Icons.close,
                        size: 2.3.h,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.2.h),

                // Title
                Center(
                  child: customText(
                    title,
                    fontSize: 16.8.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    color: AppColors.titleColor,
                  ),
                ),
                SizedBox(height: 2.4.h),

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
                          height: 5.h,
                          width: 5.h,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.4.h),
                ],

                // Message
                Center(
                  child: customText(
                    message,
                    fontSize: 16.5.sp,
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
                    onExtra ?? () => Navigator.pop(ctx),
                    backgroundColor: Colors.white,
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
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