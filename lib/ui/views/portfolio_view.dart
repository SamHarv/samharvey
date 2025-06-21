import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:samharvey/config/constants.dart';

import 'contact_view.dart';
import 'digby_view.dart';
import 'home_view.dart';
import 'app_view.dart';
import '/data/repository/app_data.dart';

class PortfolioView extends StatefulWidget {
  /// UI to display the portfolio in a PageView widget

  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView>
    with TickerProviderStateMixin {
  final pageController = PageController();
  // Animation properties for page transitions
  final _animationDuration = Duration(milliseconds: 500);
  final _curve = Curves.easeIn;
  // Detect whether mouse wheel is scrolling to prevent jank
  bool isMouse = false;

  final homeKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: _animationDuration,
      curve: _curve,
    );
  }

  @override
  void initState() {
    // Delay long enough to show full splash screen animation
    Future.delayed(
      Duration(milliseconds: 1730),
    ).then((_) => FlutterNativeSplash.remove());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.sizeOf(context).width;
    final mediaHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: false,
        title: Padding(
          padding:
              (mediaWidth / mediaHeight > 0.9)
                  ? mediaWidth > 1250
                      ? const EdgeInsets.fromLTRB(184, 8, 8, 8)
                      : const EdgeInsets.fromLTRB(80, 8, 8, 8)
                  : const EdgeInsets.all(8),
          child: Tooltip(
            message: "Navigate Home",
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                pageController.animateToPage(
                  0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              child: SizedBox(height: 60, child: Image.asset(logo)),
            ),
          ),
        ),
        actions: [
          // Navigate to contact page
          Padding(
            padding:
                (mediaWidth / mediaHeight > 0.9)
                    ? mediaWidth > 1250
                        ? const EdgeInsets.only(right: 184)
                        : const EdgeInsets.only(right: 80)
                    : const EdgeInsets.all(0),
            child: IconButton(
              tooltip: "Navigate to Contact",
              icon: FaIcon(
                FontAwesomeIcons.envelope,
                shadows: [
                  Shadow(color: blue, blurRadius: 3),
                  Shadow(color: blue, blurRadius: 6),
                  Shadow(color: blue, blurRadius: 9),
                ],
              ),
              onPressed: () {
                pageController.animateToPage(
                  11,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          SizedBox(width: 16),
        ],
      ),

      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        controller: pageController,
        child: Column(
          // Pages to display
          children: [
            SizedBox(
              key: homeKey,
              width: mediaWidth,
              height: mediaHeight - 60,
              child: HomeView(pageController: pageController),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[0]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[1]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[2]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[3]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[4]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[5]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[6]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[7]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: AppView(app: apps[8]),
            ),
            SizedBox(
              width: mediaWidth,
              height: mediaHeight - 60,
              child: DigbyView(),
            ),
            SizedBox(
              key: contactKey,
              width: mediaWidth,
              height: mediaHeight - 60,
              child: ContactView(),
            ),
          ],
        ),
      ),
    );
  }
}
