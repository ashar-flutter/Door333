import '../../../config/barrel.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
                            'Terms and Conditions',
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                          SizedBox(height: 2.5.h),
                          customText(
                            'Last updated: 1/25/2026',
                            fontSize: 16.5.sp,
                            color: AppColors.lightText,
                          ),
                          SizedBox(height: 2.h),

                          _section(
                            '1. Agreement to Terms',
                            'These Terms and Conditions constitute a legally binding agreement made between you, whether personally or on behalf of an entity ("you") and Door333 ("we," "us" or "our"), concerning your access to and use of the Door333 application.',
                          ),
                          _section(
                            '2. User Representations',
                            'By using the Application you represent and warrant that:\n\nAll registration information you submit will be true, accurate, current, and complete.\n\nYou will maintain the accuracy of such information and promptly update such registration information as necessary.\n\nYou have the legal capacity and you agree to comply with these Terms and Conditions.\n\nYou are not a minor in the jurisdiction in which you reside.',
                          ),
                          _section(
                            '3. Marketplace & Payments',
                            'Door333 includes a marketplace feature. Users agree to the following:\n\nListing fees (the "\$0.99" fee) are non-refundable once a item is approved.\n\nWe reserve the right to remove any listing that violates our policies.\n\nTransactions between buyers and sellers are the sole responsibility of the parties involved.',
                          ),
                          _section(
                            '4. Prohibited Activities',
                            'You may not access or use the Application for any purpose other than for which we make the Application available. The Application may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by us.',
                          ),
                          _section(
                            '5. Contact Us',
                            'We may terminate or suspend your account and/or access to the Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of the Terms.',
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
