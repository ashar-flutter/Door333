import '../../../config/barrel.dart';
class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  final List<Map<String, dynamic>> items = [
    {
      'image': AppImage.camera,
      'price': '\$150',
      'title': 'Vintage Film Camera',
      'condition': 'Single Hand used, 9/10 Condition',
    },
    {
      'image': AppImage.vase,
      'price': '\$45',
      'title': 'Handmade Pottery Vase',
      'condition': 'Single Hand used, 9/10 Condition',
    },
    {
      'image': AppImage.bag,
      'price': '\$85',
      'title': 'Leather Messenger Bag',
      'condition': 'Single Hand used, 9/10 Condition',
    },
    {
      'image': AppImage.coffeeTable,
      'price': '\$120',
      'title': 'Modern Coffee Table',
      'condition': 'Single Hand used, 9/10 Condition',
    },
    {
      'image': AppImage.bike,
      'price': '\$350',
      'title': 'Mountain Bike',
      'condition': 'Single Hand used, 9/10 Condition',
    },
    {
      'image': AppImage.plantStand,
      'price': '\$25',
      'title': 'Plant Stand',
      'condition': 'Single Hand used, 9/10 Condition',
    },
  ];

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
              children: [
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImage.marketBold,
                            height: 3.h,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 3.2.w),
                          customText(
                            'Marketplace',
                            fontSize: 19.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                      customButton(
                        '+  Sell',
                            () => showListingFeePopup(context),
                        width: 26,
                        height: 4.5,
                        borderRadius: 14,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: searchField(
                    fillColor:Color(0xFFF8FAFC),
                    hintText: 'Search items...',
                  ),
                ),
                SizedBox(height: 4.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Wrap(
                      spacing: 3.w,
                      runSpacing: 2.h,
                      children: List.generate(items.length, (i) {
                        final item = items[i];
                        return SizedBox(
                          width: (100.w - 4.w * 2 - 3.w) / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              onPress(
                                onTap: () => Get.to(
                                  ProductDetail(
                                    image: item['image'],
                                    title: item['title'],
                                    price: item['price'],
                                    condition: item['condition'],
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.asset(
                                    item['image'],
                                    height: 20.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              customText(
                                item['price'],
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w800
                              ),
                              SizedBox(height: 0.3.h),
                              customText(
                                item['title'],
                                fontSize: 16.5.sp,
                                fontWeight: FontWeight.w200
                              ),
                              SizedBox(height: 0.4.h),
                              customText(
                                item['condition'],
                                fontSize: 15.5.sp,
                                color: AppColors.lightText,
                                maxLines: 1,
                              ),
                              SizedBox(height: 3.h),
                              onPress(
                                onTap: () => showContactSellerPopup(
                                  context,
                                  image: item['image'],
                                  title: item['title'],
                                  price: item['price'],
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.9.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppImage.chatBubble,
                                      height: 1.8.h,
                                      ),
                                      SizedBox(width: 3.w),
                                      customText(
                                        'Message Seller',
                                        fontSize: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.6.h),
                            ],
                          ),
                        );
                      }),
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