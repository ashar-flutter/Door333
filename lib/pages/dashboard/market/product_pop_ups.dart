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
                margin: EdgeInsets.symmetric(horizontal: 9.w),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
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
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(height: 1.h),
                    customText(
                      'Send a message about "$title".',
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              image,
                              height: 5.h,
                              width: 5.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(title, fontSize: 16.3.sp),
                              customText(
                                price,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: customText('Message', fontSize: 16.sp),
                    ),
                    SizedBox(height: 1.h),
                    popUpField('Hi Alex, is this available?', maxLines: 6),
                    SizedBox(height: 4.h),
                    customButton(height: 5.8, 'Send Message', () {
                      Navigator.pop(ctx);
                    }, textColor: Colors.white),
                    SizedBox(height: 0.2.h),
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
  bool isChecked = false;

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
      return StatefulBuilder(
        builder: (context, setState) {
          return SlideTransition(
            position: slide,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.w),
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
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w900,
                        ),
                        SizedBox(height: 0.8.h),
                        customText(
                          'Secure payment required to list',
                          fontSize: 16.sp,
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          padding: EdgeInsets.all(1.5.h),
                          decoration: BoxDecoration(
                            color:  const Color(0xFFDBEAFE),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(AppImage.shopping,
                          height: 2.2.h,
                            width: 2.2.h,
                          )
                        ),
                        SizedBox(height: 3.h),
                        customText(
                          'Start Selling Today',
                          fontSize: 16.6.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 0.6.h),

                        customText(
                          'Pay a small one-time fee to list your item on the marketplace.',
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.9.h),
                        customText(
                          '\$0.99',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                        ),
                        customText('/listing', fontSize: 15.6.sp),
                        SizedBox(height: 3.4.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: customText('Cardholder Name', fontSize: 16.sp),
                        ),
                        SizedBox(height: 0.8.h),
                        popUpField('John Doe'),
                        SizedBox(height: 1.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: customText('Card Number', fontSize: 16.sp),
                        ),
                        SizedBox(height: 0.8.h),
                        popUpField(
                          '0000 0000 0000 0000',
                          suffixIcon: Icons.credit_card,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText('Expiry Date', fontSize: 16.sp),
                                  SizedBox(height: 0.8.h),
                                  popUpField(
                                    'MM/YY',
                                    keyboardType: TextInputType.datetime,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText('CVC', fontSize: 16.sp),
                                  SizedBox(height: 0.8.h),
                                  popUpField(
                                    '123',
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
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
                              color: AppColors.titleColor,
                            ),
                            SizedBox(width: 2.w),
                            customText(
                              'Payments are secure and encrypted',
                              fontSize: 15.8.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                        : Colors.grey.shade500,
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
                            SizedBox(width: 2.5.w),
                            customText(
                              'I agree to the Terms & Policy.',
                              fontSize: 15.8.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        customButton(
                          height: 5.7,
                          'Pay \$0.99 & continue',
                          () {
                            Navigator.pop(ctx);
                            paidPop(context);
                          },
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 0.2.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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
              margin: EdgeInsets.symmetric(horizontal: 9.w),
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
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 0.5.h),
                  customText('Enter product details', fontSize: 16.sp),
                  SizedBox(height: 4.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.titleColor,
                              size: 2.2.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h),
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
                      color: AppColors.titleColor,
                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  popUpField('sod'),
                  SizedBox(height: 1.5.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      'Price',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.titleColor,
                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  popUpField('0', keyboardType: TextInputType.number),
                  SizedBox(height: 1.5.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: customText(
                      'Description',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.titleColor,
                    ),
                  ),
                  SizedBox(height: 0.8.h),
                  popUpField('Describe your item', maxLines: 5),
                  SizedBox(height: 4.h),
                  customButton(height: 5.8, 'Publish Listing', () {
                    Navigator.pop(ctx);
                  }, textColor: Colors.white),
                  SizedBox(height: 0.3.h),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void paidPop(BuildContext context) {
  showCustomPopup(
    context,
    title: 'Paid Successfully',
    message:
        'Your payment \$0.99 for listing the product has been successfully paid.',
    buttonText: 'Next',
    showIcon: true,
    onButton: () {
      Navigator.pop(context);
    },
  );
}
