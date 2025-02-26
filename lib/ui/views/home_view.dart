import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samharvey/config/constants.dart';
import 'package:samharvey/logic/services/adaptive_font.dart';

import '../widgets/text_heading_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double get mediaWidth => MediaQuery.sizeOf(context).width;
  double get mediaHeight => MediaQuery.sizeOf(context).height;

  double adaptiveImageWidth(double width) {
    if (mediaWidth / mediaHeight > 0.9) {
      return width * 0.4;
    } else if (mediaWidth > 500) {
      return width * 0.8;
    } else {
      return width;
    }
  }

  double adaptiveTextWidth(double width) {
    if (mediaWidth / mediaHeight > 0.9) {
      return width * 0.5;
    } else {
      return width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (mediaWidth / mediaHeight > 0.9)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Heading to break over 2 lines if needed
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 24, 24, 24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: mediaWidth * 0.5 - 48,
                      ),
                      child: TextHeadingWidget(text: "Sam Harvey"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 24, 24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: mediaWidth * 0.5 - 48,
                      ),
                      child: Text(
                        "Flutter Engineer.\n"
                        "Scroll down to view my apps.",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: AdaptiveFontSize.getFontSize(context, 18),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Open Sans",
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                    ),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: mediaWidth * 0.5 - 56,
                    ),
                    child: SizedBox(
                      child: Image.asset(
                        "images/sam_office.png",
                        width: adaptiveImageWidth(mediaWidth),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        else
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading to break over 2 lines if needed
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: adaptiveTextWidth(mediaWidth) - 48,
                          ),
                          child: TextHeadingWidget(text: "Sam Harvey"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: adaptiveTextWidth(mediaWidth) - 48,
                          ),
                          child: Text(
                            "Flutter Engineer.\n"
                            "Scroll down to view my apps.",
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                fontSize: AdaptiveFontSize.getFontSize(
                                  context,
                                  18,
                                ),
                                fontWeight: FontWeight.bold,
                                fontFamily: "Open Sans",
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                    ),
                    child: Image.asset(
                      "images/sam_office.png",
                      width: adaptiveImageWidth(mediaWidth),
                    ),
                  ),
                ),
              ),
            ],
          ),

        Align(
          alignment: Alignment(0, 1),
          child: Image.asset("images/scroll.gif", width: 40),
        ),
      ],
    );
  }
}
