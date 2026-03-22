import '../../../config/barrel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'type': 'normal',
      'name': 'Sarah Wilson',
      'time': '2h',
      'isPublic': true,
      'avatar': AppImage.profile,
      'caption': 'Beautiful sunset view! 🇪🇸 #nature',
      'image': AppImage.sunSet,
      'likes': 124,
      'comments': 18,
      'liked': false,
    },
    {
      'type': 'sponsored',
      'name': 'Sponsored',
      'avatar': null,
      'caption': 'Check out our new summer collection! 🌟',
      'image': AppImage.men,
      'adTitle': 'Summer Sale',
      'adUrl': 'shop.example.com',
      'likes': 56,
      'comments': 2,
      'liked': false,
    },
    {
      'type': 'normal',
      'name': 'Emma Davis',
      'time': '6h',
      'isPublic': true,
      'avatar': AppImage.profile,
      'caption': 'Loving this new minimalist style ✨',
      'image': AppImage.verse,
      'likes': 256,
      'comments': 42,
      'liked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F2F5),
      body: ListView(
        children: [
          SizedBox(height: 3.h),
          // Upload bar
          onPress(onTap: () => Get.to(CreatePost()), child: _uploadBar()),
          SizedBox(height: 1.h),
          // Posts
          ...List.generate(posts.length, (i) {
            final p = posts[i];
            return p['type'] == 'sponsored'
                ? _sponsoredPost(i)
                : _normalPost(i);
          }),
          SizedBox(height: 0.8.h),
        ],
      ),
    );
  }

  // Upload bar
  Widget _uploadBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 2.5.h,
            backgroundImage: AssetImage(AppImage.profile),
          ),
          SizedBox(width: 3.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    color: AppColors.green,
                    size: 2.2.h,
                  ),
                  SizedBox(width: 2.w),
                  customText(
                    'Upload Photo / Video',
                    color: Colors.grey,
                    fontSize: 16.5.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Normal post
  Widget _normalPost(int i) {
    final p = posts[i];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 2.5.h,
                  backgroundImage: AssetImage(p['avatar']),
                ),
                SizedBox(width: 3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(p['name'], fontSize: 17.sp),
                    Row(
                      children: [
                        customText(
                          p['time'],
                          fontSize: 16.4.sp,
                          color: Colors.grey,
                        ),
                        customText(' • ', fontSize: 15.sp, color: Colors.grey),
                        Icon(
                          Icons.public_outlined,
                          size: 2.2.h,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: customText(p['caption'], fontSize: 16.5.sp),
          ),
          SizedBox(height: 2.h),
          // Image
          Image.asset(
            p['image'],
            width: double.infinity,
            height: 35.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 1.4.h),

          // Likes & comments count
          _reactionRow(i),
          SizedBox(height: 0.8.h),
          // Divider
          Divider(height: 1, color: Colors.grey.shade300),
          SizedBox(height: 0.8.h),

          // Actions
          _actionRow(i),
          SizedBox(height: 2.6.h),
        ],
      ),
    );
  }

  // Sponsored post
  Widget _sponsoredPost(int i) {
    final p = posts[i];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 2.5.h,
                  backgroundColor: AppColors.lightText,
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText('Sponsored', fontSize: 17.sp),
                      Row(
                        children: [
                          customText(
                            'Sponsored • ',
                            fontSize: 16.4.sp,
                            color: AppColors.lightText,
                            fontWeight: FontWeight.w900,
                          ),
                          Icon(
                            Icons.public,
                            size: 2.3.h,
                            color: AppColors.lightText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: AppColors.lightText),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          // Caption
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: customText(p['caption'], fontSize: 16.5.sp),
          ),
          SizedBox(height: 1.7.h),
          // Image with overlay
          Stack(
            children: [
              Image.asset(
                p['image'],
                width: double.infinity,
                height: 38.h,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: const Color(0xFFE2E8F0).withValues(alpha: 0.9),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(p['adTitle'], fontSize: 17.sp),
                          customText(
                            p['adUrl'],
                            fontSize: 16.5.sp,
                            color: AppColors.lightText,
                          ),
                        ],
                      ),
                      customButton(
                        'Shop Now',
                        () {},
                        width: 30,
                        height: 5,
                        textColor: Colors.white,
                        borderRadius: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.4.h),
          _reactionRow(i),
          SizedBox(height: 0.8.h),

          Divider(height: 1, color: Colors.grey.shade300),
          SizedBox(height: 0.8.h),

          _actionRow(i),
          SizedBox(height: 2.6.h),
        ],
      ),
    );
  }

  Widget _reactionRow(int i) {
    final p = posts[i];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(0.8.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.thumb_up_alt_sharp,
                  color: Colors.white,
                  size: 1.5.h,
                ),
              ),
              SizedBox(width: 1.6.w),
              customText(
                '${p['likes']}',
                fontSize: 16.4.sp,
                color: AppColors.titleColor,
              ),
            ],
          ),
          customText(
            '${p['comments']} comments',
            fontSize: 16.2.sp,

            color: AppColors.titleColor,
          ),
        ],
      ),
    );
  }

  Widget _actionRow(int i) {
    final p = posts[i];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _actionBtn(
            Icons.thumb_up_off_alt,
            'Like',
            p['liked'] ? AppColors.primary : AppColors.titleColor,
            () {
              setState(() => posts[i]['liked'] = !posts[i]['liked']);
            },
          ),
          _actionBtn(
            Icons.chat_bubble_outline,
            'Comment',
            AppColors.titleColor,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _actionBtn(
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return onPress(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
        child: Row(
          children: [
            Icon(icon, color: color, size: 2.7.h),
            SizedBox(width: 2.w),
            customText(label, fontSize: 16.2.sp, color: AppColors.titleColor),
          ],
        ),
      ),
    );
  }
}
