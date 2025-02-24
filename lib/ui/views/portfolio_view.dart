import 'package:flutter/material.dart';
import 'package:samharvey/ui/views/home_view.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  final pageController = PageController();

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
        children: [HomeView(), Text("Hello")],
      ),
    );
  }
}
