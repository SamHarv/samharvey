import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samharvey/logic/services/url_launcher.dart';

import '../../config/constants.dart';
import '../../logic/services/adaptive_font.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 32,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: mediaWidth - 48),
            child: Text(
              "Sam Harvey",
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: AdaptiveFontSize.getFontSize(context, 24),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Open Sans",
                  color: white,
                  shadows: [
                    Shadow(color: blue, blurRadius: 3),
                    Shadow(color: blue, blurRadius: 6),
                    Shadow(color: blue, blurRadius: 9),
                  ],
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email
              IconButton(
                icon: FaIcon(FontAwesomeIcons.envelope),
                onPressed:
                    () => UrlLauncher.launch("mailto:srharvey93@gmail.com"),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.github),
                onPressed:
                    () => UrlLauncher.launch("https://github.com/SamHarv"),
              ),
              // Youtube
              IconButton(
                icon: FaIcon(FontAwesomeIcons.youtube),
                onPressed:
                    () => UrlLauncher.launch(
                      "https://www.youtube.com/channel/UCO6fpaaJYCkVSZQIhA4Gi8Q",
                    ),
              ),
              // LinkedIn
              IconButton(
                icon: FaIcon(FontAwesomeIcons.linkedin),
                onPressed:
                    () => UrlLauncher.launch(
                      "www.linkedin.com/in/sam-harvey-83a182234",
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
