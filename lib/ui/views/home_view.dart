import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/text_heading_widget.dart';

class HomeView extends StatelessWidget {
  final double width;
  const HomeView({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset("images/sam_office.png", width: width * 0.9),
            ),
            Align(
              alignment: Alignment(-1, 0.0),
              child: Image.asset("images/scroll.gif", width: width * 0.1),
            ),
          ],
        ),
      ],
    );
  }
}
