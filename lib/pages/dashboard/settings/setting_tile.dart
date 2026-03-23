import '../../../config/barrel.dart';

class SettingTile extends StatelessWidget {
  final String image;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;
  final bool isRed;
  final VoidCallback? onTap;

  const SettingTile({
    super.key,
    required this.image,
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
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.7.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(1.h),
              decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
              child: Image.asset(
                image,
                height: 2.4.h,
                width: 2.4.h,
                color: iconColor,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    title,
                    fontSize: 16.6.sp,
                    color: isRed
                        ? const Color(0xFFEF4444)
                        : AppColors.titleColor,
                  ),
                  if (subtitle.isNotEmpty)
                    customText(
                      subtitle,
                      fontSize: 16.3.sp,
                      color: AppColors.lightText,
                    ),
                ],
              ),
            ),
            if (!isRed)
              Icon(
                Icons.arrow_forward_ios,
                size: 1.6.h,
                color: AppColors.lightText,
              ),
          ],
        ),
      ),
    );
  }
}
