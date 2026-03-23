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
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 9.w, top: 3.h),
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
                  SizedBox(height: 10.h),
                  Center(
                    child: Image.asset(
                      AppImage.splash,
                      height: 12.h,
                      width: 12.h,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Center(
                    child: customText(
                      "Come as you are. We're glad you're here.",
                      fontSize: 16.7.sp,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Email', fontSize: 16.5.sp),
                        SizedBox(height: 1.6.h),
                        textField(
                          'Ex.abc@example.com',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.alternate_email,
                        ),
                        SizedBox(height: 3.h),
                        customText('Your Password', fontSize: 16.5.sp),
                        SizedBox(height: 1.6.h),
                        textField(
                          '••••••••',
                          keyboardType: TextInputType.visiblePassword,
                          obSecure: true,
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(height: 1.9.h),
                        onPress(
                          onTap: () => Get.to(ForgetPassword()),
                          child: customText(
                            'Forgot Password?',
                            fontSize: 16.5.sp,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 4.5.h),
                        customButton(height: 6.4, 'Login', () {
                          Get.offAll(() => NavBar());
                        }, textColor: Colors.white),
                        SizedBox(height: 2.8.h),
                        Container(height: 1, color: AppColors.titleColor),
                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                              "Don't have an account?  ",
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w300,
                            ),
                            onPress(
                              onTap: () => Get.to(SignUp()),
                              child: customText(
                                'Register',
                                fontSize: 16.5.sp,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 9.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            onPress(
                              onTap: () => Get.to(TermsAndConditions()),

                              child: customText(
                                'Terms and Conditions',
                                fontSize: 16.sp,
                                color: AppColors.lightText,
                              ),
                            ),
                            onPress(
                              onTap: () => Get.to(PrivacyPolicy()),
                              child: customText(
                                'Privacy Policy',
                                fontSize: 16.sp,
                                color: AppColors.lightText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
