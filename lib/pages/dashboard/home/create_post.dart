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
                        SizedBox(width: 4.w),
                        customText(
                          'Create Post',
                          fontSize: 17.sp,
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
                        : Colors.grey.shade400,
                    borderColor: Colors.transparent,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            SizedBox(
              width: double.infinity,
              child: Divider(height: 1, color: Colors.grey.shade300),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
              child: Row(
                children: [
                  onPress(
                    child: CircleAvatar(
                      radius: 2.7.h,
                      backgroundImage: AssetImage(AppImage.profile),
                    ),
                    onTap: () => Get.to(ProfilePage()),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText('Jane Doe', fontSize: 16.8.sp),
                      SizedBox(height: 0.6),
                      Row(
                        children: [
                          Icon(
                            Icons.public,
                            size: 2.h,
                            color: AppColors.lightText,
                          ),
                          SizedBox(width: 1.w),
                          customText(
                            'Public',
                            fontSize: 15.6.sp,
                            color: AppColors.lightText,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 2.3.h,
                            color: AppColors.lightText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.3.h,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: TextField(
                        maxLines: null,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "What's on your mind, Jane?",
                          hintStyle: TextStyle(
                            fontFamily: 'Helix',
                            color: AppColors.lightText,
                            fontSize: 15.3.sp,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontFamily: 'Helix',
                          fontSize: 16.sp,
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    if (_pickedImage != null) ...[
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                _pickedImage!,
                                width: double.infinity,
                                height: 28.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1.3.h,
                            right: 6.w,
                            child: onPress(
                              onTap: () => setState(() => _pickedImage = null),
                              child: Container(
                                padding: EdgeInsets.all(0.8.h),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
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
                      child: Divider(height: 1, color: Colors.grey.shade300),
                    ),
                    SizedBox(height: 2.2.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            'Add to your post',
                            fontSize: 16.6.sp,
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
