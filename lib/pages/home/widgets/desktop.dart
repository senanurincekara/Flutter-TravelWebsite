import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_project_flutter/constants/constants.dart';
import 'package:web_project_flutter/helpers/style.dart';
import 'package:web_project_flutter/widgets/contact_desktop.dart';
import 'package:web_project_flutter/widgets/customAdsContainer_desktop.dart';
import 'package:web_project_flutter/widgets/customRoadContainer.dart';
import 'package:web_project_flutter/widgets/popular_destinations_dekstop.dart';
import 'package:web_project_flutter/widgets/servicesContainer_desktop.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isHoveringContainer = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1440),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              mainText1,
                              textStyle: GoogleFonts.aBeeZee(
                                  fontSize: 25,
                                  color: active,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                          totalRepeatCount: 10,
                          pause: const Duration(milliseconds: 3000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              mainText2,
                              textStyle: GoogleFonts.aBeeZee(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                          totalRepeatCount: 10,
                          pause: const Duration(milliseconds: 4000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              mainParagraph,
                              textStyle: GoogleFonts.aBeeZee(
                                  fontSize: 15,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                          totalRepeatCount: 10,
                          pause: const Duration(milliseconds: 3300),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () => null,
                          onHover: (hovering) {
                            setState(() => isHoveringContainer = hovering);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            padding:
                                EdgeInsets.all(isHoveringContainer ? 10 : 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(30),
                              color: isHoveringContainer
                                  ? Color.fromARGB(255, 148, 12, 0)
                                  : active,
                              boxShadow: [
                                BoxShadow(
                                    blurStyle: BlurStyle.normal,
                                    color: Colors.black,
                                    spreadRadius: 0.5,
                                    offset: Offset(1, 1))
                              ],
                            ),
                            child: Text(
                              "Book a Trip",
                              style: GoogleFonts.yujiSyuku(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/homeLogo.png",
                                width: screenSize.width / 3.5,
                                height: screenSize.width / 3.5,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.03,
                        horizontal: screenSize.height * 0.03),
                    child: CustomRoadContainer(
                      screenSize: screenSize.width,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, right: 50, left: 50, bottom: 10),
                    child: CustomAdsContainerDesktop(
                      screenSize: screenSize.width,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: ServicesContainerDesktop(
                    screenSizeWidth: screenSize.width,
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: PopularDestinationsDesktop(
                      screenSizeWidth: screenSize.width,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10),
                    child: ContactDesktop(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
