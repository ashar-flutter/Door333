import '../../config/barrel.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": Icons.home_filled, "label": "Home"},
    {"icon": Icons.storefront_outlined, "label": "Market"},
    {"icon": Icons.textsms_outlined, "label": "Chat"},
    {"icon": Icons.settings, "label": "Settings"},
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    const Placeholder(),
    const MainChatPage(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
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
                    Icon(
                      items[index]["icon"],
                      size: 24,
                      color: isActive ? AppColors.primary : Color(0xFF000000).withValues(alpha: 0.6)
                    ),
                    const SizedBox(height: 3),
                    customText(
                      items[index]["label"],
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w200,
                      color: isActive ? AppColors.primary : AppColors.lightText,
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