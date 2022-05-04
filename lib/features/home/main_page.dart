import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mrkt_app/features/profile/profile_page.dart';
import 'package:mrkt_app/utils/app_colors.dart';
import 'package:mrkt_app/utils/constants.dart';
import 'package:mrkt_app/widget/circular_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String route = "/mainpage";
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  late List<Widget> pages;
  final List<String> unSelectedIcons = [
    "asset/icons/ic_home.svg",
    "asset/icons/ic_test.svg",
    "asset/icons/ic_performance.svg",
  ];
  final List<String> selectedIcon = [
    "asset/icons/ic_solid_home.svg",
    "asset/icons/ic_solid_test.svg",
    "asset/icons/ic_solid_performance.svg",
  ];
  @override
  void initState() {
    super.initState();
    pages = [
      Center(child: Text("home page")),
      Center(child: Text("test page")),
      Center(child: Text("performance page")),
      const ProfilePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isNeedSafeArea = MediaQuery.of(context).viewPadding.bottom > 0;
    return DefaultTabController(
        length: pages.length,
        child: Scaffold(
          body: SafeArea(
            child: TabBarView(
              children: pages,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5)
            ]),
            child: TabBar(
                padding: EdgeInsets.only(
                    bottom: isNeedSafeArea ? spacing_24 : spacing_10),
                onTap: (index) => setState(() {
                      currentIndex = index;
                    }),
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 4.0, color: AppColors.gigas),
                    insets: EdgeInsets.fromLTRB(28.0, 0.0, 28.0, 48.0)),
                tabs: generateTab()),
          ),
        ));
  }

  List<Widget> generateTab() {
    final tabs = <Widget>[];
    for (var index = 0; index < pages.length; index++) {
      if (index < pages.length - 1) {
        tabs.add(Tab(
            key: ValueKey(index),
            icon: SvgPicture.asset(
              currentIndex == index
                  ? selectedIcon[index]
                  : unSelectedIcons[index],
              width: 27,
              height: 27,
            )));
      } else {
        tabs.add(buildAvatar());
      }
    }
    return tabs;
  }

  Widget buildAvatar() {
    return const DecoratedBox(
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.gigas),
      child: Padding(
          padding: EdgeInsets.all(spacing_4),
          child: CircularImage(
            avatarUrl: 'asset/icons/ic_user.svg',
            radius: 16,
          )),
    );
  }
}
