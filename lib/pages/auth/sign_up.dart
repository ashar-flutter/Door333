import '../../config/barrel.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

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
                  padding: EdgeInsets.only(left: 9.w, top: 3.h),
                  child: onPress(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 2.3.h,
                      color: AppColors.titleColor,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.h),
                        customText(
                          'Register',
                          fontSize: 19.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                        SizedBox(height: 0.8.h),
                        Wrap(
                          children: [
                            customText('Create an ', fontSize: 16),
                            customText(
                              'account',
                              color: AppColors.primary,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                            customText(
                              ' to access all the features of ',
                              fontSize: 15,
                            ),
                            customText(
                              'Door333!',
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 11.h,
                                width: 11.h,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 11.h,
                                      width: 11.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          AppImage.person,
                                          height: 4.h,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 4.h,
                                        width: 4.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.file_upload_outlined,
                                          color: Colors.white,
                                          size: 1.9.h,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.6.h),
                              customText(
                                'Tap to upload photo',
                                fontSize: 17.sp,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 3.3.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText('First Name', fontSize: 16.5.sp),
                                  SizedBox(height: 1.6.h),
                                  textField('Ex.John'),
                                ],
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText('Last Name', fontSize: 16.5.sp),
                                  SizedBox(height: 1.6.h),
                                  textField('Ex.Doe'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        customText('Email', fontSize: 16.5.sp),
                        SizedBox(height: 1.6.h),
                        textField(
                          'Ex.abc@example.com',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.alternate_email,
                        ),
                        SizedBox(height: 2.5.h),
                        customText('Your Password', fontSize: 16.5.sp),
                        SizedBox(height: 1.h),
                        textField(
                          '••••••••',
                          keyboardType: TextInputType.visiblePassword,
                          obSecure: true,
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(height: 2.8.h),
                        Row(
                          children: [
                            onPress(
                              onTap: () {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                height: 1.8.h,
                                width: 1.8.h,
                                decoration: BoxDecoration(
                                  color: isChecked
                                      ? AppColors.primary
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: isChecked
                                        ? AppColors.primary
                                        : Colors.grey.shade600,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: isChecked
                                    ? Icon(
                                        Icons.check,
                                        size: 1.5.h,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            customText(
                              'I agree to the Terms & Conditions and Privacy Policy. ',
                              fontSize: 15.2.sp,
                              color: AppColors.lightText,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ),
                        SizedBox(height: 2.4.h),
                        customButton(
                          height: 6.4,
                          'Create Account',
                          () {},
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                              'Already have an account?  ',
                              fontSize: 16.5.sp,
                              fontWeight: FontWeight.w300,
                            ),
                            onPress(
                              onTap: () => Get.back(),
                              child: customText(
                                'Login',
                                fontSize: 16.5.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
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
