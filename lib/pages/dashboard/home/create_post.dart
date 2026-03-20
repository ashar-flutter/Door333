import 'dart:io';
import '../../../config/barrel.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? _pickedImage;

  void _onImagePicked(File? image) {
    setState(() {
      _pickedImage = image;
    });
  }

  void _onPostTap() {
    showCustomPopup(
      context,
      title: 'Post Submitted for Review',
      message:
          'Your post is gone for approval, uploaded when approved by admin.',
      buttonText: 'Okay, Got it',
      showIcon: true,
      onButton: () {
        Navigator.pop(context);
        showCustomPopup(
          context,
          showIcon: true,
          title: 'Post Uploaded',
          message: 'Your post uploaded successfully',
          buttonText: 'Close',
          slideFromRight: true,
          onButton: () => Navigator.pop(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  onPress(
                    onTap: () => Get.back(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.close,
                          size: 2.3.h,
                          color: AppColors.titleColor,
                        ),
                        SizedBox(width: 2.w),
                        customText(
                          'Create Post',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.titleColor,
                        ),
                      ],
                    ),
                  ),
                  customButton(
                    'Post',
                    _onPostTap,
                    width: 20,
                    height: 4.5,
                    backgroundColor: _pickedImage != null
                        ? AppColors.primary
                        : Colors.grey.shade100,
                    textColor: _pickedImage != null
                        ? Colors.white
                        : Colors.grey.shade600,
                    borderColor: Colors.transparent,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(height: 1, color: Colors.grey.shade200),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              child: Row(
                children: [
                  onPress(
                    child: CircleAvatar(
                      radius: 2.5.h,
                      backgroundImage: AssetImage(AppImage.profile),
                    ),
                    onTap: () => Get.to(ProfilePage()),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        'Jane Doe',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      Row(
                        children: [
                          Icon(Icons.public, size: 2.h, color: Colors.grey),
                          SizedBox(width: 1.w),
                          customText(
                            'Public',
                            fontSize: 15.sp,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 2.h,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    TextField(
                      maxLines: null,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "What's on your mind, Jane?",
                        hintStyle: TextStyle(
                          fontFamily: 'Hellix',
                          color: AppColors.lightText,
                          fontSize: 15.4.sp,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: TextStyle(
                        fontFamily: 'Hellix',
                        fontSize: 16.sp,
                        color: AppColors.lightText,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    if (_pickedImage != null) ...[
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _pickedImage!,
                              width: double.infinity,
                              height: 28.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 1.h,
                            right: 2.w,
                            child: onPress(
                              onTap: () => setState(() => _pickedImage = null),
                              child: Container(
                                padding: EdgeInsets.all(0.5.h),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 1.8.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: Divider(height: 1, color: Colors.grey.shade200),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      height: 7.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 1.2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            'Add to your post',
                            fontSize: 16.4.sp,
                            color: AppColors.titleColor,
                          ),
                          Row(
                            children: [
                              ImagePickerWidget(
                                onImagePicked: _onImagePicked,
                                child: Icon(
                                  Icons.photo_library_outlined,
                                  color: AppColors.green,
                                  size: 2.3.h,
                                ),
                              ),
                              SizedBox(width: 3.w),
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
