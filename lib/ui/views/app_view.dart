// Column:
// Row: Title, logo
// Description
// Row: GitHub, Play Store, App Store, Web
// Image
// Scroll down hint?

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samharvey/data/models/app_model.dart';
import 'package:samharvey/logic/services/url_launcher.dart';

import '../../config/constants.dart';
import '../../logic/services/adaptive_font.dart';

class AppView extends StatelessWidget {
  final AppModel app;

  const AppView({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 24,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: mediaWidth - 48),
                child: Text(
                  app.title,
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
              if (app.title != "Thoughts")
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(app.logo, height: 50),
                )
              else
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(app.logo),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: mediaWidth - 48),
                child: Text(
                  app.description,
                  style: TextStyle(
                    fontSize: AdaptiveFontSize.getFontSize(context, 16),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(app.image),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          tooltip: "GitHub",
                          hoverColor: blue,
                          splashColor: white,
                          icon: const FaIcon(
                            FontAwesomeIcons.github,
                            color: white,
                            size: 40,
                          ),
                          onPressed: () => UrlLauncher.launch(app.githubUrl),
                        ),
                        app.appStoreUrl == null
                            ? const SizedBox()
                            : IconButton(
                              tooltip: "Apple App Store",
                              hoverColor: blue,
                              splashColor: white,
                              icon: const FaIcon(
                                FontAwesomeIcons.appStore,
                                color: white,
                                size: 40,
                              ),
                              onPressed:
                                  () => UrlLauncher.launch(app.appStoreUrl!),
                            ),
                        app.playStoreUrl == null
                            ? const SizedBox()
                            : IconButton(
                              tooltip: "Google Play Store",
                              hoverColor: blue,
                              splashColor: white,
                              icon: const FaIcon(
                                FontAwesomeIcons.googlePlay,
                                color: white,
                                size: 40,
                              ),
                              onPressed:
                                  () => UrlLauncher.launch(app.playStoreUrl!),
                            ),
                        app.webUrl == null
                            ? const SizedBox()
                            : IconButton(
                              tooltip: "Web Version",
                              hoverColor: blue,
                              splashColor: white,
                              icon: const Icon(
                                Icons.language,
                                color: white,
                                size: 40,
                              ),
                              onPressed: () => UrlLauncher.launch(app.webUrl!),
                            ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Text("Scroll down"),
        ],
      ),
    );
  }
}
