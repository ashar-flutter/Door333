import '../../../config/barrel.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: AppColors.primary,
                              size: 3.h,
                            ),
                            SizedBox(width: 3.w),
                            customText(
                              'Settings',
                              fontSize: 19.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w900,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),

                        Center(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 6.h,
                                    backgroundImage: AssetImage(
                                      AppImage.profile,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(0.9.h),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0DA2E7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 1.8.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                height: 27,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                        size: 2.h,
                                      ),
                                      SizedBox(width: 1.w),
                                      customText(
                                        'Remove Photo',
                                        fontSize: 16.sp,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(height: 1.h, color: AppColors.hintText),

                        SizedBox(height: 3.5.h),

                        customText(
                          'Personal Information',
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.titleColor,
                        ),
                        SizedBox(height: 2.h),
                        SettingTile(
                          icon: Icons.person,
                          iconColor: const Color(0xFF0DA2E7),
                          bgColor: const Color(0xFFDBEAFE),
                          title: 'Name',
                          subtitle: 'Jane Doe',
                        ),
                        SizedBox(height: 2.h),

                        customText(
                          'Security',
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 1.h),
                        SettingTile(
                          icon: Icons.lock,
                          iconColor: Colors.orange,
                          bgColor: const Color(0xFFFFEDD4),
                          title: 'Password',
                          subtitle: 'Change your password',
                        ),
                        SizedBox(height: 2.h),

                        customText(
                          'Actions',
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 1.h),
                        SettingTile(
                          icon: Icons.logout,
                          iconColor: Colors.grey,
                          bgColor: Colors.grey.shade200,
                          title: 'Log Out',
                          subtitle: '',
                        ),
                        SettingTile(
                          icon: Icons.warning_amber_outlined,
                          iconColor: Colors.red,
                          bgColor: Colors.red.shade50,
                          title: 'Delete Account',
                          subtitle: '',
                          isRed: true,
                        ),
                        SizedBox(height: 3.h),

                        Center(
                          child: customText(
                            'Door333 V1.0.0',
                            fontSize: 17.sp,
                            color: AppColors.hintText,
                          ),
                        ),
                        SizedBox(height: 2.h),
                      ],
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
