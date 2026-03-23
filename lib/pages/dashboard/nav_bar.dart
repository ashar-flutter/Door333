import '../../config/barrel.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": AppImage.home, "boldIcon": AppImage.homeBold, "label": "Home"},
    {
      "icon": AppImage.market,
      "boldIcon": AppImage.marketBold,
      "label": "Market",
    },
    {"icon": AppImage.chat, "boldIcon": AppImage.chatBold, "label": "Chat"},
    {
      "icon": AppImage.settings,
      "boldIcon": AppImage.settingsBold,
      "label": "Settings",
    },
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    const MarketPlace(),
    const MainChatPage(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 1.2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              bool isActive = currentIndex == index;

              return onPress(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      isActive
                          ? items[index]["boldIcon"]
                          : items[index]["icon"],
                      width: 3.h,
                      height: 3.h,
                      color: isActive ? AppColors.primary : null,
                    ),
                    SizedBox(height: 0.5.h),
                    customText(
                      items[index]["label"],
                      fontSize: 16.4.sp,
                      fontWeight: isActive ? FontWeight.w900 : FontWeight.w300,
                      color: isActive
                          ? AppColors.primary
                          : Color(0xFF000000).withValues(alpha: 0.7),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}