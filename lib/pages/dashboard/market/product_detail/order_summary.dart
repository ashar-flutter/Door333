import '../../../../config/barrel.dart';

class OrderSummary extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const OrderSummary({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
                                ),
                              ),
                              SizedBox(width: 4.w),
                              customText(
                                  'Order Summary',
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
                   SizedBox(height: 1.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300,
                              width: 1.2
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    widget.image,
                                    height: 8.h,
                                    width: 8.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                      widget.title,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(height: 0.2.h),

                                    customText(
                                      'Sold by John',
                                      fontSize: 16.2.sp,
                                      color: AppColors.lightText,
                                    ),
                                    SizedBox(height: 0.9.h),

                                    customText(
                                      widget.price,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.3.h),

                          // Purchase protection
                          Row(
                            children: [
                              Icon(
                                Icons.shield_outlined,
                                color: AppColors.green,
                                size: 2.6.h,
                              ),
                              SizedBox(width: 2.w),
                              customText(
                                'Purchase Protection',
                                fontSize: 16.9.sp,
                              ),
                            ],
                          ),
                          SizedBox(height: 1.6.h),
                          customText(
                            "Your purchase is protected. If the item isn't as described, you'll get a full refund.",
                            fontSize: 16.4.sp,
                            color: AppColors.lightText,
                          ),
                          SizedBox(height: 3.h),
                        ],
                      ),
                    ),

                    SizedBox(height: 0.5.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 1.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          SizedBox(height: 1.5.h),
                          _row('Item Price', '\$85.00'),
                          SizedBox(height: 1.h),
                          _row('Shipping', '\$15.00'),
                          SizedBox(height: 1.h),
                          _row('Service Fee', '\$2.50'),
                          SizedBox(height: 1.5.h),
                        ],
                      ),
                    ),

                    SizedBox(height: 0.7.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),

                      height: 1,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          SizedBox(height: 1.h),
                          _row('Total', '\$102.50', bold: true,
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
              child: customButton(
                height: 6.4,
                'Proceed to Checkout',
                    () => Get.to(ShippingAddress()),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          label,
          fontSize: 16.8.sp,
          fontWeight: bold ? FontWeight.w500 : FontWeight.w100,
          color: bold ? AppColors.titleColor : AppColors.lightText,
        ),
        customText(
          value,
          fontSize: 16.8.sp,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
        ),
      ],
    );
  }
}