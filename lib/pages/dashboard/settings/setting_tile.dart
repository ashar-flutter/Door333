import '../../../config/barrel.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;
  final bool isRed;
  final VoidCallback? onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    this.subtitle = '',
    this.isRed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return onPress(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(0.8.h),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 2.3.h),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    title,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: isRed ?Color(0xFFEF4444): AppColors.titleColor,
                  ),
                  if (subtitle.isNotEmpty)
                    customText(subtitle, fontSize: 16.sp, color: Colors.grey),
                ],
              ),
            ),
            if (!isRed)
              Icon(Icons.arrow_forward_ios, size: 1.8.h, color: AppColors.titleColor),
          ],
        ),
      ),
    );
  }
}