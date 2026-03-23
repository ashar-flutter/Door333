import 'package:door333/config/barrel.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToBoarding();
  }

  Future<void> _navigateToBoarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Boarding()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: -5,
              left: -40,
              child: Image.asset(
                AppImage.shade1,
                fit: BoxFit.contain,
                height: 300,
                width: 300,
              ),
            ),
            Center(
              child: Image.asset(
                AppImage.splash,
                width: 27.w,
                height: 27.h,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                AppImage.shade2,
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}