import '../../../config/barrel.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hi, are you free today?', 'isMe': false},
    {'text': "Yes, what's up?", 'isMe': true},
    {'text': 'See you tomorrow! 👋', 'isMe': false},
  ];

  Widget _messageField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: TextStyle(
                  fontFamily: 'Helix',
                  fontSize: 16.sp,
                  color: AppColors.primaryDarkBlue,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 1.5.h,
                ),
              ),
              style: TextStyle(fontFamily: 'Helix', fontSize: 16.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: Image.asset(
              AppImage.sendSms,
              height: 2.8.h,
              width: 2.8.h,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

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
                SizedBox(height: 2.2.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 1.5.h,
                  ),
                  child: Row(
                    children: [
                      onPress(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back,
                          size: 2.4.h,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      CircleAvatar(
                        radius: 2.9.h,
                        backgroundImage: AssetImage(AppImage.profile),
                      ),
                      SizedBox(width: 3.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText('Sarah Wilson', fontSize: 17.sp,
                          fontWeight: FontWeight.w700
                          ),
                          customText(
                            'Active now',
                            fontSize: 16.2.sp,
                            color: AppColors.lightText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Container(height: 2.7, color: Colors.grey.shade300),

                // Messages
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    children: [
                      // Profile header in chat
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 2.h),
                            CircleAvatar(
                              radius: 5.5.h,
                              backgroundImage: AssetImage(AppImage.profile),
                            ),
                            SizedBox(height: 1.3.h),
                            customText(
                              'Sarah Wilson',
                              fontSize: 17.3.sp,
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(height: 9.h),
                          ],
                        ),
                      ),
                      ...messages.map((m) => _bubble(m)),
                    ],
                  ),
                ),

                // Message input
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 1.5.h,
                  ),
                  child: Row(children: [Expanded(child: _messageField())]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bubble(Map m) {
    return Align(
      alignment: m['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.4.h),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        decoration: BoxDecoration(
          color: m['isMe'] ? AppColors.primary : Colors.grey.shade100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: m['isMe'] ? Radius.circular(16) : Radius.circular(4),
            bottomRight: m['isMe'] ? Radius.circular(4) : Radius.circular(16),
          ),
        ),
        child: customText(
          m['text'],
          fontSize: 16.4.sp,
          color: m['isMe'] ? Colors.white : Colors.grey.shade600,
        ),
      ),
    );
  }
}
