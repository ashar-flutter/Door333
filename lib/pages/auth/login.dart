import '../../config/barrel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              child: Image.asset(
                AppImage.back1,
                fit: BoxFit.contain,
                height: 300,
                width: 300,
              ),
            ),
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                AppImage.back2,
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6.w, top: 3.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: onPress(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 2.3.h,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        Center(
                          child: Image.asset(
                            AppImage.splash,
                            height: 11.h,
                            width: 11.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: customText(
                            "Come as you are. We're glad you're here.",
                            fontSize: 16.6.sp,
                            fontWeight: FontWeight.w300,
                          ),
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
                        SizedBox(height: 2.5.h),
                        customText(
                          'Your Password',
                          fontSize: 16.3.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 1.h),
                        textField(
                          '••••••••',
                          keyboardType: TextInputType.visiblePassword,
                          obSecure: true,
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(height: 2.h),
                        onPress(
                          onTap: () => Get.to(ForgetPassword()),
                          child: customText(
                            'Forgot Password?',
                            fontSize: 16.3.sp,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        customButton('Login', () {}, textColor: Colors.white),
                        SizedBox(height: 2.5.h),
                        Container(height: 1, color: AppColors.titleColor),
                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                              "Don't have an account?  ",
                              fontSize: 16.6.sp,
                              fontWeight: FontWeight.w300,
                            ),
                            onPress(
                              onTap: () => Get.to(SignUp()),
                              child: customText(
                                'Register',
                                fontSize: 16.3.sp,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        'Terms and Conditions',
                        fontSize: 16.4.sp,
                        color: AppColors.lightText,
                      ),
                      customText(
                        'Privacy Policy',
                        fontSize: 16.4.sp,
                        color: AppColors.lightText,
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
