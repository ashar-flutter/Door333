import '../../../../config/barrel.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
                                'Payment Method',
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
                            'Cardholder Name',
                            fontSize: 16.5.sp,
                          ),
                          SizedBox(height: 1.h),
                          popUpField('John Doe',

                          ),
                          SizedBox(height: 2.h),

                          customText(
                            'Card Number',
                            fontSize: 16.5.sp,
                          ),
                          SizedBox(height: 1.h),
                         popUpField(
                            '0000 0000 0000 0000',
                            keyboardType: TextInputType.number,
                            suffixIcon: Icons.credit_card,
                          ),
                          SizedBox(height: 2.h),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                      'Expiry Date',
                                      fontSize: 16.5.sp,
                                    ),
                                    SizedBox(height: 1.h),
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
                                    customText(
                                      'CVC',
                                      fontSize: 16.5.sp,
                                    ),
                                    SizedBox(height: 1.h),
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
                                size: 1.5.h,
                                color: AppColors.lightText,
                              ),
                              SizedBox(width: 2.w),
                              customText(
                                'Payments are secure and encrypted',
                                fontSize: 16.sp,
                                color: AppColors.lightText,
                              ),
                            ],
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
                'Pay \$102.50',
                    () => Get.to(OrderConfirmed()),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}