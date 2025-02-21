import 'package:flutter/material.dart';
import 'package:samharvey/ui/widgets/text_heading_widget.dart';

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

  double get mediaHeight => MediaQuery.sizeOf(context).height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SizedBox(height: 60, child: Image.asset("images/logo.png")),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    TextHeadingWidget(text: "Sam Harvey"),
                    Text(mediaWidth.toString()),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "images/sam_office.png",
                  width: adaptiveWidth(mediaWidth),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
