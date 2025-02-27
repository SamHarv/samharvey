import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:samharvey/ui/views/contact_view.dart';
import 'package:samharvey/ui/views/digby_view.dart';
import 'package:samharvey/ui/views/home_view.dart';

import '../../data/repository/app_data.dart';
import 'app_view.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  final pageController = PageController();
  int _index = 0;
  final _animationDuration = Duration(milliseconds: 500);
  final _curve = Curves.easeIn;
  bool isMouse = false;

  @override
  Widget build(BuildContext context) {
    // pageController.addListener(() {
    //   // Only if using mouse wheel
    //   (pointerSignal) {
    //     if (pointerSignal is PointerScrollEvent) {
    //       // Do not scroll

    //       if (pointerSignal.scrollDelta.dy > 0) {
    //         pageController.animateToPage(
    //           pageController.page!.toInt() + 1,
    //           duration: const Duration(milliseconds: 60),
    //           curve: Curves.easeIn,
    //         );
    //       } else {
    //         pageController.animateToPage(
    //           pageController.page!.toInt() - 1,
    //           duration: const Duration(milliseconds: 60),
    //           curve: Curves.easeIn,
    //         );
    //       }
    //     }
    //   };
    //   if (pageController.position.userScrollDirection ==
    //       ScrollDirection.reverse) {
    //     pageController.animateToPage(
    //       pageController.page!.toInt() + 1,
    //       duration: const Duration(milliseconds: 60),
    //       curve: Curves.easeIn,
    //     );
    //   } else if (pageController.position.userScrollDirection ==
    //       ScrollDirection.forward) {
    //     if (pageController.page!.toInt() == 0) {
    //       return;
    //     }
    //     pageController.animateToPage(
    //       pageController.page!.toInt() - 1,
    //       duration: const Duration(milliseconds: 60),
    //       curve: Curves.easeIn,
    //     );
    //   }
    // });
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: () {
              pageController.animateToPage(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: SizedBox(height: 60, child: Image.asset("images/logo.png")),
          ),
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.envelope,
              shadows: [
                Shadow(color: Colors.blue, blurRadius: 3),
                Shadow(color: Colors.blue, blurRadius: 6),
                Shadow(color: Colors.blue, blurRadius: 9),
              ],
            ),
            onPressed: () {
              pageController.animateToPage(
                10,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isMouse = false;
            });
          },
          child: Listener(
            onPointerSignal: (pointerSignal) {
              if (pointerSignal is PointerScrollEvent) {
                if (pointerSignal.kind == PointerDeviceKind.mouse) {
                  setState(() {
                    isMouse = true;
                  });
                } else {
                  setState(() {
                    isMouse = false;
                  });
                }
                if (pointerSignal.scrollDelta.dy > 0) {
                  if (_index == 10) {
                    return;
                  }
                  pageController.nextPage(
                    duration: _animationDuration,
                    curve: _curve,
                  );
                } else {
                  if (_index == 0) {
                    return;
                  }
                  pageController.previousPage(
                    duration: _animationDuration,
                    curve: _curve,
                  );
                }
              }
            },
            child: PageView(
              physics:
                  isMouse
                      ? const NeverScrollableScrollPhysics()
                      : const PageScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: pageController,
              pageSnapping: true,
              onPageChanged: (index) {
                setState(() => _index = index);
              },
              children: [
                HomeView(),
                AppView(app: apps[0]),
                AppView(app: apps[1]),
                AppView(app: apps[2]),
                AppView(app: apps[3]),
                AppView(app: apps[4]),
                AppView(app: apps[5]),
                AppView(app: apps[6]),
                AppView(app: apps[7]),
                DigbyView(),
                ContactView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
