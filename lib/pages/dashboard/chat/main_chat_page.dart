import '../../../config/barrel.dart';

class MainChatPage extends StatefulWidget {
  const MainChatPage({super.key});

  @override
  State<MainChatPage> createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage> {
  final List<Map<String, dynamic>> stories = [
    {'name': 'Sarah', 'avatar': AppImage.profile, 'online': true},
    {'name': 'Emma', 'avatar': AppImage.profile, 'online': false},
  ];

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Sarah Wilson',
      'avatar': AppImage.profile,
      'msg': 'You: See you tomorrow! 🎉',
      'time': '10:30 AM',
      'unread': true,
      'online': true,
    },
    {
      'name': 'Mike Brown',
      'avatar': AppImage.profile,
      'msg': 'The photos look great',
      'time': 'Yesterday',
      'unread': false,
      'online': false,
    },
    {
      'name': 'Emma Davis',
      'avatar': AppImage.profile,
      'msg': 'Can you send me the link?',
      'time': 'Mon',
      'unread': false,
      'online': true,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImage.chat,
                        height: 3.h,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 3.2.w),
                      customText(
                        'Chats',
                        fontSize: 19.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: searchField(),
                ),
                SizedBox(height: 4.h),

                // Stories row
                SizedBox(
                  height: 10.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    itemCount: stories.length,
                    itemBuilder: (_, i) => Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 3.4.h,
                                backgroundImage: AssetImage(
                                  stories[i]['avatar'],
                                ),
                              ),
                              if (stories[i]['online'])
                                Positioned(
                                  bottom: 0,
                                  right: 2,
                                  child: Container(
                                    height: 1.4.h,
                                    width: 1.4.h,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 0.5.h),
                          customText(
                            stories[i]['name'],
                            fontSize: 16.8.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.5.h),

                // Chat list
                Expanded(
                  child: ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (_, i) {
                      final c = chats[i];
                      return onPress(
                        onTap: () => Get.to(Inbox()),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 1.2.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 3.4.h,
                                        backgroundImage: AssetImage(
                                          c['avatar'],
                                        ),
                                      ),
                                      if (c['online'])
                                        Positioned(
                                          bottom: 0,
                                          right: 2,
                                          child: Container(
                                            height: 1.3.h,
                                            width: 1.3.h,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                          c['name'],
                                          fontSize: 16.8.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        customText(
                                          c['msg'],
                                          fontSize: 16.3.sp,
                                          color: AppColors.lightText,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      customText(
                                        c['time'],
                                        fontSize: 16.sp,
                                        color: AppColors.lightText,
                                      ),
                                      SizedBox(height: 0.5.h),
                                      if (c['unread'])
                                        Container(
                                          height: 1.5.h,
                                          width: 1.5.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              if (i < chats.length - 1) SizedBox(height: 1.h),
                            ],
                          ),
                        ),
                      );
                    },
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
