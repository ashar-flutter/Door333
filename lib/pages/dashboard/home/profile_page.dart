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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 3.h),
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
                    SizedBox(height: 4.h),
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
                            padding: EdgeInsets.all(0.9.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
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
                    SizedBox(height: 1.5.h),
                    customText(
                      'Jane Doe',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      padding: EdgeInsets.symmetric(vertical: 1.2.h),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 2.3.h,
                            color: AppColors.titleColor,
                          ),
                          SizedBox(width: 2.w),
                          customText(
                            'Edit Profile',
                            fontSize: 15.9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),

                    Divider(height: 1, color: Colors.grey.shade200),
                    SizedBox(height: 1.5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: customText(
                          'Posts',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.5.h),
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
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        Row(
                                          children: [
                                            customText(
                                              '2d',
                                              fontSize: 15.sp,
                                              color: Colors.grey,
                                            ),
                                            customText(
                                              ' • ',
                                              fontSize: 15.sp,
                                              color: Colors.grey,
                                            ),
                                            Icon(
                                              Icons.public,
                                              size: 2.h,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.more_horiz, color: Colors.grey),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          // Caption
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: customText(
                              'Updated my profile picture!📸',
                              fontSize: 16.2.sp,
                            ),
                          ),
                          SizedBox(height: 1.h),

                          // Post image
                          Image.asset(
                            AppImage.profile,
                            width: double.infinity,
                            height: 32.h,
                            fit: BoxFit.cover,
                          ),

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
                                      padding: EdgeInsets.all(0.4.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.thumb_up,
                                        color: Colors.white,
                                        size: 2.h,
                                      ),
                                    ),
                                    SizedBox(width: 1.w),
                                    customText(
                                      '96',
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                customText(
                                  '52 comments',
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),

                          Divider(height: 1, color: Colors.grey.shade200),

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
                                        color: Colors.grey,
                                        size: 2.8.h,
                                      ),
                                      SizedBox(width: 2.w),
                                      customText(
                                        'Like',
                                        fontSize: 16.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
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
                                        color: Colors.grey,
                                        size: 2.8.h,
                                      ),
                                      SizedBox(width: 2.w),
                                      customText(
                                        'Comment',
                                        fontSize: 16.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
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
