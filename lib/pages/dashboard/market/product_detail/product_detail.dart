import '../../../../config/barrel.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String condition;

  const ProductDetail({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.condition,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
                    Stack(
                      children: [
                        Image.asset(
                          widget.image,
                          width: double.infinity,
                          height: 35.h,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 4.h,
                          left: 4.w,
                          child: onPress(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: EdgeInsets.all(1.h),
                              decoration: BoxDecoration(
                                color: Color(0x66000000),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 1.6.h,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 2.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            widget.title,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 0.5.h),
                          customText(
                            widget.price,
                            fontSize: 17.3.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                          SizedBox(height: 1.h),
                          customText(
                            'Queens, NY · Listed 2 days ago',
                            fontSize: 16.6.sp,
                            color: AppColors.lightText,
                          ),
                          SizedBox(height: 2.h),

                          // Seller row
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 1.5.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 2.2.h,
                                      backgroundColor: Colors.grey.shade200,
                                      child: customText(
                                        'J',
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          'John',
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        customText(
                                          'Joined 2023',
                                          fontSize: 16.sp,
                                          color: AppColors.lightText,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                customButton(
                                  'View Profile',
                                  () {},
                                  width: 28,
                                  height: 4.5,
                                  backgroundColor: Colors.grey.shade100,
                                  borderColor: Colors.grey.shade300,
                                  fontSize: 14,
                                  borderRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),

                          customText(
                            'Description',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 0.8.h),
                          customText(
                            "Excellent condition. Barely used. Pick up only or can ship at buyer's expense. Selling because I'm moving. Price is firm.",
                            fontSize: 16.6.sp,
                            color: AppColors.lightText,
                          ),
                          SizedBox(height: 4.h),

                          customText(
                            'Seller Information',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    customText(
                                      'Verified',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    customText(
                                      'Identity',
                                      fontSize: 15.6.sp,
                                      color: AppColors.lightText,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        5,
                                        (_) => Icon(
                                          Icons.star,
                                          color: AppColors.titleColor,
                                          size: 2.6.h,
                                        ),
                                      ),
                                    ),
                                    customText(
                                      '12 Reviews',
                                      fontSize: 16.sp,
                                      color: AppColors.lightText,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Row(
                children: [
                  Expanded(
                    child: customButton(
                      height: 6,
                      'Message',
                      () => showContactSellerPopup(
                        context,
                        image: widget.image,
                        title: widget.title,
                        price: widget.price,
                      ),
                      backgroundColor: Colors.white,
                      textColor: AppColors.titleColor,
                      borderColor: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: customButton(
                      height: 6,

                      'Buy Now',
                      () => Get.to(
                        OrderSummary(
                          image: widget.image,
                          title: widget.title,
                          price: widget.price,
                        ),
                      ),
                      textColor: Colors.white,
                      icon: Icons.shopping_bag_outlined,
                      iconPosition: IconPosition.end,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
