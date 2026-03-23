import '../../../config/barrel.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                SizedBox(height: 1.3.h,),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.6.w),
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            'Privacy Policy',
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                          SizedBox(height: 2.5.h),
                          customText(
                            'Last updated: 5/21/2026',
                            fontSize: 16.5.sp,
                            color: AppColors.lightText,
                          ),
                          SizedBox(height: 2.h),

                          _section(
                            '1. Introduction',
                            'Welcome to Door333. We respect your privacy and are committed to protecting your personal data. This privacy policy will tell you about how we look after your personal data when you visit our application and tell you about your privacy rights and how the law protects you.',
                          ),
                          _section(
                            '2. Data We Collect',
                            'We may collect, use, store and transfer different kinds of personal data about you which we have grouped together as follows:\n\nIdentity Data includes first name, last name, username or similar identifier.\n\nContact Data includes email address and telephone numbers.\n\nTransaction Data includes details about payments to and from you and other details of products you have purchased from us.\n\nTechnical Data includes internet protocol (IP) address, your login data, browser type and version, time zone setting and location.',
                          ),
                          _section(
                            '3. How We Use Your Data',
                            'We will only use your personal data when the law allows us to build our community, and will use your personal data in the following circumstances:\n\nWhere we need to perform the contract we are about to enter into or have entered into with you.\n\nWhere it is necessary for our legitimate interests (or those of a third party) and your interests and fundamental rights do not override those interests.\n\nWhere we need to comply with a legal or regulatory obligation.',
                          ),
                          _section(
                            '4. Data Security',
                            'We have put in place appropriate security measures to prevent your personal data from being accidentally lost, used or accessed in an unauthorized way, altered or disclosed.',
                          ),
                          _section(
                            '5. Contact Us',
                            'If you have any questions about this privacy policy or our privacy practices, please contact us.',
                          ),
                        ],
                      ),
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

  Widget _section(String title, String body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(title, fontSize: 17.sp, fontWeight: FontWeight.w400),
        SizedBox(height: 1.3.h),
        customText(body, fontSize: 16.3.sp, color: AppColors.lightText),
        SizedBox(height: 2.3.h),
      ],
    );
  }
}