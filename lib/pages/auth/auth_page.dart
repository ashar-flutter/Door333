import '../../config/barrel.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                          'Welcome to',
                          fontSize: 18.5.sp,
                        ),
                        SizedBox(height: 0.5.h),
                        customText(
                          'Door333',
                          fontSize: 19.5.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                        SizedBox(height: 1.h),
                        customText(
                          'A door back to faith, opened with love,\nnot condemnation.',
                          fontSize: 16.5.sp,

                        ),
                        SizedBox(height: 7.h),
                        customText(
                          "Let's Get Started...",
                          fontSize: 17.sp,
                        ),
                        SizedBox(height: 1.5.h),
                        customButton(
                          height: 6.4,
                          'Continue with Email',
                          () {},
                          backgroundColor: Colors.white,
                          textColor: AppColors.titleColor,
                          borderColor: AppColors.titleColor,
                          icon: Icons.alternate_email,
                          iconPosition: IconPosition.end,
                        ),
                        SizedBox(height: 2.9.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                              'Already have an account? ',
                              fontSize: 16.sp,
                            ),
                            onPress(
                              onTap: () => Get.to(Login()),
                              child: customText(
                                'Login',
                                fontSize: 16.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w900,
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
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                  child: Row(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
