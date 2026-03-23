import '../../../../config/barrel.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
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
                                'Shipping Address',
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
                    SizedBox(height: 1.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          customText(
                            'Street Address',
                            fontSize: 16.5.sp,
                          ),
                          SizedBox(height: 1.h),
                         popUpField(
                            '123 Main St',
                          ),
                          SizedBox(height: 2.h),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                      'City',
                                      fontSize: 16.5.sp,
                                    ),
                                    SizedBox(height: 1.h),
                                    popUpField(
                                      'New York',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                      'State',
                                      fontSize: 16.5.sp,
                                    ),
                                    SizedBox(height: 1.h),
                                    popUpField(
                                      'NY',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),

                          customText(
                            'ZIP Code',
                            fontSize: 16.5.sp,
                          ),
                          SizedBox(height: 1.h),
                          popUpField(
                            '10001',
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 3.h),

                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_shipping_outlined,
                                  color: Color(0xFF155DFC),
                                  size: 2.7.h,
                                ),
                                SizedBox(width: 3.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 0.7.h,),
                                    customText(
                                      'Standard Shipping',
                                      fontSize: 16.8.sp,
                                      color: Color(0xFF1C398E),
                                    ),
                                    SizedBox(height: 0.9.h,),

                                    customText(
                                      'Estimated delivery: 3-5 business days',
                                      fontSize: 15.5.sp,
                                      color: Color(0xFF155DFC),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
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
                'Continue to Payment',
                () => Get.to(PaymentMethod()),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
