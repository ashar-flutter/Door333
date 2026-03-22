import '../../../config/barrel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F7FA),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 9.w, top: 3.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: onPress(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 2.3.h,
                    color: AppColors.titleColor,
                  ),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 3.h),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 6.h,
                          backgroundImage: AssetImage(AppImage.profile),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1.h),
                            decoration: BoxDecoration(
                              color:Colors.grey.shade100,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white,

                              width: 3)
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.titleColor,
                              size: 1.8.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.7.h),
                    customText(
                      'Jane Doe',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      padding: EdgeInsets.symmetric(vertical: 1.2.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 2.4.h,
                            color: AppColors.titleColor,
                          ),
                          SizedBox(width: 2.w),
                          customText(
                            'Edit Profile',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),

                    Divider(height: 1, color: Colors.grey.shade300),
                    SizedBox(height: 2.3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: customText(
                          'Posts',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.3.h),
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 1.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 3.h,
                                      backgroundImage: AssetImage(
                                        AppImage.profile,
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          'Jane Doe',
                                          fontSize: 17.sp,
                                        ),
                                        SizedBox(height: 0.2.h,),
                                        Row(
                                          children: [
                                            customText(
                                              '2d',
                                              fontSize: 16.sp,
                                              color: AppColors.lightText,
                                            ),
                                            customText(
                                              ' • ',
                                              fontSize: 16.sp,
                                              color: AppColors.lightText,
                                            ),
                                            Icon(
                                              Icons.public,
                                              size: 2.h,
                                              color: AppColors.lightText,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.more_horiz,
                                  color: AppColors.lightText,

                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.2.h),
                          // Caption
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: customText(
                              'Updated my profile picture!📸',
                              fontSize: 16.7.sp,
                            ),
                          ),
                          SizedBox(height: 1.4.h),

                          // Post image
                          Image.asset(
                            AppImage.verse,
                            width: double.infinity,
                            height: 50.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 1.4.h),

                          // Likes & comments
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 1.h,
                            ),
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
                                        Icons.thumb_up,
                                        color: Colors.white,
                                        size: 1.6.h,
                                      ),
                                    ),
                                    SizedBox(width: 1.5.w),
                                    customText(
                                      '96',
                                      fontSize: 16.7.sp,
                                      color: AppColors.lightText,
                                    ),
                                  ],
                                ),
                                customText(
                                  '52 comments',
                                  fontSize: 16.6.sp,
                                  color: AppColors.lightText,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.4.h,),
                          Divider(height: 1, color: Colors.grey.shade300),
                          SizedBox(height: 1.h,),

                          // Like & Comment actions
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              onPress(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.h,
                                    horizontal: 6.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up_outlined,
                                        color: AppColors.lightText,
                                        size: 2.8.h,
                                      ),
                                      SizedBox(width: 2.w),
                                      customText(
                                        'Like',
                                        fontSize: 16.6.sp,
                                        color: AppColors.lightText,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onPress(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.h,
                                    horizontal: 6.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.chat_bubble_outline,
                                        color: AppColors.lightText,
                                        size: 2.8.h,
                                      ),
                                      SizedBox(width: 2.w),
                                      customText(
                                        'Comment',
                                        fontSize: 16.6.sp,
                                        color: AppColors.lightText,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
