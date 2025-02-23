import 'package:flutter/material.dart';
import 'package:samharvey/ui/views/home_view.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  double get mediaWidth => MediaQuery.sizeOf(context).width;
  double adaptiveWidth(double width) {
    if (mediaWidth > 1250) {
      return width * 0.3;
    } else if (mediaWidth > 500) {
      return width * 0.5;
    } else {
      return width;
    }
  }

  final pageController = PageController();

  double get mediaHeight => MediaQuery.sizeOf(context).height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(height: 60, child: Image.asset("images/logo.png")),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pageController.animateToPage(
                1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            icon: Icon(Icons.email),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: [HomeView(width: adaptiveWidth(mediaWidth)), Text("Hello")],
      ),
    );
  }
}
