import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samharvey/config/constants.dart';

import '../widgets/text_heading_widget.dart';

class HomeView extends StatelessWidget {
  final double width;
  const HomeView({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
                        constraints: BoxConstraints(maxWidth: width * 0.8),
                        child: TextHeadingWidget(text: "Sam Harvey"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: width * 0.8),
                        child: Text(
                          "Flutter Engineer.\n"
                          "Scroll down to view my apps.",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Open Sans",
                              color: Colors.white,
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
                    // width: width * 0.9,
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment(0.5, 0.9),
          child: Image.asset("images/scroll.gif", width: width * 0.1),
          // child: GlassMorphism(
          //   // width: width,
          //   blur: 10,
          //   opacity: 0.2,
          //   color: Colors.grey.shade100,
          //   clipRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(32),
          //     topRight: Radius.circular(32),
          //   ),
          //   borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(32),
          //     topRight: Radius.circular(32),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          //     child: Image.asset("images/scroll.gif", width: width * 0.1),
          //   ),
          // ),
        ),
      ],
    );
  }
}
