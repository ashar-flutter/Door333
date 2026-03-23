import '../../config/barrel.dart';

class Boarding extends StatefulWidget {
  const Boarding({super.key});

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': AppImage.onBoard1,
      'title': 'Religious Posting',
      'subtitle':
          'Share your spiritual journey and connect deeply with your faith community.',
    },
    {
      'image': AppImage.onBoard2,
      'title': 'Community of Love',
      'subtitle':
          'Join a supportive environment where kindness and helping others are core values.',
    },
    {
      'image': AppImage.onBoard3,
      'title': 'Trusted Marketplace',
      'subtitle':
          'A dedicated space for our community to exchange goods and services safely.',
    },
  ];

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      setState(() => currentIndex++);
    } else {
      Get.offAll(() => const AuthPage());
    }
  }

  void skipToAuth() {
    Get.offAll(() => const AuthPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: -20,
                left: -40,
                child: Image.asset(
                  AppImage.back1,
                  fit: BoxFit.contain,
                  height: 300,
                  width: 300,
                ),
              ),
              Positioned(
                bottom: -20,
                right: -20,
                child: Image.asset(
                  AppImage.back2,
                  height: 250,
                  width: 250,
                  fit: BoxFit.contain,
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Image.asset(
                        onboardingData[currentIndex]['image']!,
                        key: ValueKey(currentIndex),
                        height: 30.h,
                        width: 60.w,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,

                      ),
                    ),
                    SizedBox(height: 4.9.h),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        key: ValueKey(currentIndex),
                        children: [
                          customText(
                            onboardingData[currentIndex]['title']!,
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.w900,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 1.8.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: customText(
                              onboardingData[currentIndex]['subtitle']!,
                              fontSize: 16.3.sp,
                              color: AppColors.titleColor,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: customButton(
                        height: 6.4,
                        currentIndex == onboardingData.length - 1
                            ? 'Welcome to Door333'
                            : 'Next',
                        nextPage,
                        backgroundColor: Colors.white,
                        textColor: AppColors.primary,
                        borderColor: AppColors.primary,
                        icon: Icons.arrow_forward,
                        iconPosition: IconPosition.end,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    onPress(
                      onTap: skipToAuth,
                      child: customText(
                        "Skip",
                        color: AppColors.primary,
                      ),
                    ),
                    Container(height: 1.3, width: 10.w, color: AppColors.primary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
