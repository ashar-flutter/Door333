import '../../../../config/barrel.dart';

class OrderConfirmed extends StatefulWidget {
  const OrderConfirmed({super.key});

  @override
  State<OrderConfirmed> createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              SizedBox(width: 4.w),
                              onPress(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 1.6.h,
                                  color: AppColors.titleColor,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              customText(
                                'Order Confirmed',
                                fontSize: 17.5.sp,
                              ),
                            ],
                          ),
                          SizedBox(height: 1.4.h),
                        ],
                      ),
                    ),

                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 7.h),
                          Center(
                            child: Container(
                              height: 10.h,
                              width: 10.h,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  AppImage.check,
                                  height: 5.1.h,
                                  width: 5.1.h,
                                  color: AppColors.green,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.6.h),
                          Center(
                            child: customText(
                              'Payment Successful!',
                              fontSize: 17.2.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Center(
                            child: customText(
                              'Your order has been placed successfully.',
                              fontSize: 16.4.sp,
                              color: AppColors.lightText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 3.5.h),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey.shade50,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  'Transaction ID',
                                  fontSize: 16.5.sp,
                                  color: AppColors.lightText,
                                ),
                                customText(
                                  '#TRX-CYRIL3VIV',
                                  fontSize: 16.2.sp,
                                ),
                              ],
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                  'Amount Paid',
                                  fontSize: 16.5.sp,
                                  color: AppColors.lightText,
                                ),
                                customText(
                                  '\$102.50',
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
              child: customButton(
                height: 6.4,
                'Back to Marketplace',
                    () => Get.until((r) => r.isFirst),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}