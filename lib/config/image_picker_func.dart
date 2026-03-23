import 'barrel.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onImagePicked;
  final Widget? child;
  final bool showPreview;

  const ImagePickerWidget({
    super.key,
    required this.onImagePicked,
    this.child,
    this.showPreview = false,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  Future<void> _pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (file != null) {
        final imageFile = File(file.path);
        setState(() => _pickedImage = imageFile);
        widget.onImagePicked(imageFile);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void _removeImage() {
    setState(() => _pickedImage = null);
    widget.onImagePicked(null);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child != null) {
      return onPress(
        onTap: _pickImage,
        child: widget.child,
      );
    }

    if (widget.showPreview && _pickedImage != null) {
      return Stack(
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
              onTap: _removeImage,
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
      );
    }

    return const SizedBox.shrink();
  }
}