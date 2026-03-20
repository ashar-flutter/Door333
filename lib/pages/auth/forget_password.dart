import '../../config/barrel.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: -20,
              left: -40,
              child: Image.asset(AppImage.back1, height: 300, width: 300),
            ),
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(AppImage.back2, height: 250, width: 250),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w, top: 3.h),
                  child: onPress(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 2.3.h,
                      color: AppColors.titleColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.h),
                      customText(
                        'Forgot Password?',
                        fontSize: 20.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(height: 1.h),
                      customText(
                        'Recover you password if you have forgot the password!',
                        fontSize: 17.sp,
                      ),
                      SizedBox(height: 4.h),
                      customText(
                        'Email',
                        fontSize: 16.3.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 1.h),
                      textField(
                        'Ex.abc@example.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.alternate_email,
                      ),
                      SizedBox(height: 3.h),
                      customButton(
                        'Send Reset Link',
                            () => showCustomPopup(
                          context,
                          title: 'Check your email for the reset link.',
                          message: "We've sent a password reset link to your email address. Please follow the link to create a new password.",
                          buttonText: 'Resend Link',
                          backLabel: 'Back to Login',
                          onBack: () { Navigator.pop(context); Get.back(); },
                          onButton: () => Navigator.pop(context),
                        ),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}