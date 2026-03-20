import '../../../config/barrel.dart';

void showContactSellerPopup(
    BuildContext context, {
      required String image,
      required String title,
      required String price,
    }) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: const Color(0xB3000000),
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (_, _, _) => const SizedBox.shrink(),
    transitionBuilder: (ctx, anim, _, _) {
      final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutBack);
      return ScaleTransition(
        scale: curved,
        child: FadeTransition(
          opacity: anim,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: onPress(
                        onTap: () => Navigator.pop(ctx),
                        child: Icon(
                          Icons.close,
                          size: 2.3.h,
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    customText(
                      'Contact Alex',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.titleColor,
                    ),
                    SizedBox(height: 1.h),
                    customText(
                      'Send a message about "$title".',
                      fontSize: 17.sp,
                      color: AppColors.lightText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              image,
                              height: 6.h,
                              width: 6.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                title,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              customText(
                                price,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.titleColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: customText(
                        'Message',
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    textField(
                      'Hi Alex, is this available?',
                      line: 3,
                      fillColor: Colors.transparent,
                      enableBorderColor: Colors.grey.shade300,
                    ),
                    SizedBox(height: 5.h),
                    customButton(
                        height: 6,
                        'Send Message', () {
                      Navigator.pop(ctx);
                      showListingFeePopup(context);
                    }, textColor: Colors.white),
                    SizedBox(height: 1.h),
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

void showListingFeePopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: const Color(0xB3000000),
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (_, _, _) => const SizedBox.shrink(),
    transitionBuilder: (ctx, anim, _, _) {
      final slide = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic));
      return SlideTransition(
        position: slide,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: onPress(
                        onTap: () => Navigator.pop(ctx),
                        child: Icon(
                          Icons.close,
                          size: 2.3.h,
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    customText(
                      'Listing Fee',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: 0.8.h),
                    customText(
                      'Secure payment required to list',
                      fontSize: 17.sp,
                      color: AppColors.lightText,
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      padding: EdgeInsets.all(1.5.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE9FE),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.storefront_outlined,
                        color: AppColors.primary,
                        size: 3.h,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    customText(
                      'Start Selling Today',
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 0.6.h),

                    customText(
                      'Pay a small one-time fee to list your item on the marketplace.',
                      fontSize: 16.7.sp,
                      color: AppColors.lightText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.5.h),
                    customText(
                      '\$0.99',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    customText(
                      '/listing',
                      fontSize: 16.sp,
                      color: AppColors.lightText,
                    ),
                    SizedBox(height: 3.2.h),
                    textField(
                      'John Doe',
                      fillColor: Colors.transparent,
                      enableBorderColor: Colors.grey.shade300,
                    ),
                    SizedBox(height: 1.h),
                    textField(
                      '0000 0000 0000 0000',
                      suffixIcon: Icons.credit_card,
                      keyboardType: TextInputType.number,
                      fillColor: Colors.transparent,
                      enableBorderColor: Colors.grey.shade300,
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Expanded(
                          child: textField(
                            'MM/YY',
                            keyboardType: TextInputType.datetime,
                            fillColor: Colors.transparent,
                            enableBorderColor: Colors.grey.shade300,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: textField(
                            '123',
                            keyboardType: TextInputType.number,
                            fillColor: Colors.transparent,
                            enableBorderColor: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 2.h,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 2.w),
                        customText(
                          'Payments are secure and encrypted',
                          fontSize: 16.sp,
                          color: AppColors.lightText,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.2.h),
                    Row(
                      children: [
                        SizedBox(
                          height: 2.h,
                          width: 2.h,
                          child: Checkbox(
                            value: false,
                            onChanged: (_) {},
                            activeColor: AppColors.primary,
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.2,
                            ),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        customText(
                          'I agree with Terms and Privacy Policy.',
                          fontSize: 15.sp,
                          color: AppColors.lightText,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    customButton(
                        height: 6,
                        'Pay \$0.99 & continue', () {
                      Navigator.pop(ctx);
                      showNewListingPopup(context);
                    }, textColor: Colors.white),
                    SizedBox(height: 1.h),
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

void showNewListingPopup(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: const Color(0xB3000000),
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (_, _, _) => const SizedBox.shrink(),
    transitionBuilder: (ctx, anim, _, _) {
      final slide = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic));
      return SlideTransition(
        position: slide,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: onPress(
                      onTap: () => Navigator.pop(ctx),
                      child: Icon(
                        Icons.close,
                        size: 2.3.h,
                        color: AppColors.lightText,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  customText(
                    'New Listing',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 0.5.h),
                  customText(
                    'Enter product details',
                    fontSize: 17.sp,
                    color: AppColors.titleColor,
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(

                          height: 9.h,
                          width: 9.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.titleColor,
                              size: 2.h,
                            ),
                          ),
                        ),
                        customText(
                          'Add Photos',
                          fontSize: 16.sp,
                          color: AppColors.lightText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      'Title',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.titleColor
                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  textField(
                    'sod',
                    fillColor: Colors.transparent,
                    enableBorderColor: Colors.grey.shade300,
                  ),
                  SizedBox(height: 1.5.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      'Price',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                        color: AppColors.titleColor

                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  textField(
                    '0',
                    keyboardType: TextInputType.number,
                    fillColor: Colors.transparent,
                    enableBorderColor: Colors.grey.shade300,
                  ),
                  SizedBox(height: 1.5.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      'Description',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                        color: AppColors.titleColor

                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  textField(
                    'Describe your item',
                    line: 3,
                    fillColor: Colors.transparent,
                    enableBorderColor: Colors.grey.shade300,
                  ),
                  SizedBox(height: 5.h),
                  customButton(
                    height: 6,
                    'Publish Listing',
                        () {
                      Navigator.pop(ctx);
                    },
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );

}