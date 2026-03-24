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
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (_, _, _) => const SizedBox.shrink(),
    transitionBuilder: (ctx, anim, _, _) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.92, end: 1.0).animate(
          CurvedAnimation(parent: anim, curve: Curves.easeOutCubic),
        ),
        child: FadeTransition(
          opacity: anim,
          child: Center(
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

                    Center(
                      child: customText(
                        title,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 2.2.h),

                    if (showIcon && customContent == null) ...[
                      Center(
                        child: Container(
                          height: 10.h,
                          width: 10.h,
                          decoration: BoxDecoration(
                            color: AppColors.lightGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              AppImage.check,
                              height: 5.1.h,
                              width: 5.1.h,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.2.h),
                    ],

                    Center(
                      child: customText(
                        message,
                        fontSize: 16.5.sp,
                        color: AppColors.titleColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 4.7.h),

                    if (customContent != null) ...[customContent],

                    customButton(
                      height: 6,
                      buttonText,
                      onButton,
                      textColor: Colors.white,
                      backgroundColor: buttonColor,
                      borderColor: buttonColor,
                    ),

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
          ),
        ),
      );
    },
  );
}