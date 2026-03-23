import '../../../config/barrel.dart';

void showChangeNamePopup(BuildContext context) {
  showCustomPopup(
    context,
    title: 'Change Name',
    message: 'Update your first and last name visible on your profile.',
    buttonText: 'Save Changes',
    onButton: () => Navigator.pop(context),
    extraButton: 'Cancel',
    onExtra: () => Navigator.pop(context),
    customContent: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.2.h),

        customText('First Name', fontSize: 16.7.sp),
        SizedBox(height: 1.h),
        popUpField('Jane'),
        SizedBox(height: 1.6.h),
        customText('Last Name', fontSize: 16.7.sp),
        SizedBox(height: 1.h),
        popUpField('Doe'),
        SizedBox(height: 6.h),
      ],
    ),
  );
}

void showChangePasswordPopup(BuildContext context) {
  showCustomPopup(
    context,
    title: 'Change Password',
    message: 'Update your password to keep your account secure.',
    buttonText: 'Update Password',
    onButton: () => Navigator.pop(context),
    extraButton: 'Cancel',
    onExtra: () => Navigator.pop(context),
    customContent: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.3.h),

        customText('Current Password', fontSize: 16.7.sp),
        SizedBox(height: 1.h),
        popUpField(
          'Enter current password',
          keyboardType: TextInputType.visiblePassword,
          obSecure: true,
        ),
        SizedBox(height: 2.h),
        customText('New Password', fontSize: 16.7.sp),
        SizedBox(height: 1.h),
        popUpField(
          'Enter new password',
          keyboardType: TextInputType.visiblePassword,
          obSecure: true,
        ),
        SizedBox(height: 2.h),
        customText('Confirm Password', fontSize: 16.7.sp),
        SizedBox(height: 1.h),
        popUpField(
          'Confirm new password',
          keyboardType: TextInputType.visiblePassword,
          obSecure: true,
        ),
        SizedBox(height: 4.5.h),
      ],
    ),
  );
}

void showLogoutPopup(BuildContext context) {
  showCustomPopup(
    context,
    title: 'Logout',
    message: 'Are you sure you want to logout?',
    buttonText: 'Yes',
    onButton: () {
      Navigator.pop(context);
    },
    extraButton: 'No',
    onExtra: () => Navigator.pop(context),
  );
}

void showDeleteAccountPopup(BuildContext context) {
  showCustomPopup(
    context,
    title: 'Delete Account',
    message:
        'Are you absolutely sure? This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
    buttonText: 'Delete Account',
    onButton: () => Navigator.pop(context),
    extraButton: 'Cancel',
    onExtra: () => Navigator.pop(context),
    buttonColor: const Color(0xFFEF4444),
  );
}
