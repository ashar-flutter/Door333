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
                          fontSize: 18.7.sp,
                          fontWeight: FontWeight.w200,
                        ),
                        SizedBox(height: 0.5.h),
                        customText(
                          'Door333',
                          fontSize: 20.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                        SizedBox(height: 1.h),
                        customText(
                          'A door back to faith, opened with love,\nnot condemnation.',
                          fontSize: 16.9.sp,
                          fontWeight: FontWeight.w300,

                        ),
                        SizedBox(height: 7.h),
                        customText(
                          "Let's Get Started...",
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w300,
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
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                              'Already have an account? ',
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w300,
                            ),
                            onPress(
                              onTap: () => Get.to(Login()),
                              child: customText(
                                'Login',
                                fontSize: 17.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
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
                        fontSize: 17.sp,
                        color: AppColors.lightText,
                        fontWeight: FontWeight.w200,
                      ),
                      customText(
                        'Privacy Policy',
                        fontSize: 17.sp,
                        color: AppColors.lightText,
                        fontWeight: FontWeight.w200,
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
