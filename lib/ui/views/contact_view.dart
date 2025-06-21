import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samharvey/ui/widgets/fade_in_widget.dart';

import '/config/constants.dart';
import '/logic/services/adaptive_font.dart';
import '/logic/services/url_launcher.dart';

class ContactView extends StatelessWidget {
  /// UI to display contact information
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
            child: FadeInWidget(
              widgetToFadeIn: Text(
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
          ),
          // Email & social icons
          FadeInWidget(
            widgetToFadeIn: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Email
                IconButton(
                  tooltip: "Email Sam",
                  hoverColor: blue,
                  icon: FaIcon(FontAwesomeIcons.envelope),
                  onPressed:
                      () => UrlLauncher.launch("mailto:srharvey93@gmail.com"),
                ),
                // Github
                IconButton(
                  tooltip: "Github",
                  hoverColor: blue,
                  icon: FaIcon(FontAwesomeIcons.github),
                  onPressed:
                      () => UrlLauncher.launch("https://github.com/SamHarv"),
                ),
                // Youtube
                IconButton(
                  tooltip: "Youtube",
                  hoverColor: blue,
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  onPressed:
                      () => UrlLauncher.launch(
                        "https://www.youtube.com/channel/UCO6fpaaJYCkVSZQIhA4Gi8Q",
                      ),
                ),
                // LinkedIn
                IconButton(
                  tooltip: "LinkedIn",
                  hoverColor: blue,
                  icon: FaIcon(FontAwesomeIcons.linkedin),
                  onPressed:
                      () => UrlLauncher.launch(
                        "https://www.linkedin.com/in/sam-harvey-83a182234/",
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
