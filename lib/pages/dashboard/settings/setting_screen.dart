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
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Image.asset(
                              AppImage.settings,
                              height: 3.h,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: 3.2.w),
                            customText(
                              'Settings',
                              fontSize: 19.5.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.6.h),
                        Center(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3.3,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      radius: 6.3.h,
                                      backgroundImage: AssetImage(
                                        AppImage.profile,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 4,
                                    child: Container(
                                      padding: EdgeInsets.all(1.3.h),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0DA2E7),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.3,
                                            ),
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 1.9.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.2.h),
                              Container(
                                height: 30,
                                width: 115,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1.3,
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.delete_outline,
                                        color: Color(0xFFEF4444),
                                        size: 2.h,
                                      ),
                                      SizedBox(width: 1.w),
                                      customText(
                                        'Remove Photo',
                                        fontSize: 16.1.sp,
                                        color: Color(0xFFEF4444),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(height: 1.h, color: Colors.grey.shade300),
                        SizedBox(height: 3.6.h),
                        customText('Personal Information', fontSize: 17.4.sp),
                        SizedBox(height: 2.h),
                        SettingTile(
                          image: AppImage.name,
                          iconColor: const Color(0xFF0DA2E7),
                          bgColor: const Color(0xFFDBEAFE),
                          title: 'Name',
                          subtitle: 'Jane Doe',
                          onTap: () => showChangeNamePopup(context),
                        ),
                        SizedBox(height: 2.3.h),
                        customText('Security', fontSize: 17.4.sp),
                        SizedBox(height: 2.h),
                        SettingTile(
                          image: AppImage.password,
                          iconColor: Colors.orange,
                          bgColor: const Color(0xFFFFEDD4),
                          title: 'Password',
                          subtitle: 'Change your password',
                          onTap: () => showChangePasswordPopup(context),
                        ),
                        SizedBox(height: 2.3.h),
                        customText('Actions', fontSize: 17.4.sp),
                        SizedBox(height: 2.h),
                        SettingTile(
                          image: AppImage.logout,
                          iconColor: Colors.grey,
                          bgColor: Colors.grey.shade200,
                          title: 'Log Out',
                          subtitle: '',
                          onTap: () => showLogoutPopup(context),
                        ),
                        SettingTile(
                          image: AppImage.delete,
                          iconColor: Color(0xFFEF4444),
                          bgColor: Colors.transparent,
                          title: 'Delete Account',
                          subtitle: '',
                          isRed: true,
                          onTap: () => showDeleteAccountPopup(context),
                        ),
                        SizedBox(height: 5.4.h),
                        Center(
                          child: customText(
                            'Door333 V1.0.0',
                            fontSize: 17.sp,
                            color: AppColors.lightText,
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
