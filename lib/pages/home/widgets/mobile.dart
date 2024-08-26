import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_project_flutter/constants/constants.dart';
import 'package:web_project_flutter/helpers/style.dart';
import 'package:web_project_flutter/widgets/customAdvContainer_mobile.dart';
import 'package:web_project_flutter/widgets/customRoadContainer_mobile.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isHoveringContainer = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Animation duration
      vsync: this,
    )..repeat(reverse: true); // Repeating animation

    _animation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.easeInOut), // Smooth animation
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; // Get the screen size

    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _animation.value),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: screenSize.width * 0.9),
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/homeLogo.png",
                                width: screenSize.width * 0.8,
                                height: screenSize.height *
                                    0.4, // Adjust for screen size
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Container(
                  constraints: BoxConstraints(maxWidth: screenSize.width * 0.9),
                  margin:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainText1,
                        style: GoogleFonts.aBeeZee(
                            fontSize: screenSize.width *
                                0.06, // Adjust for screen size
                            color: active,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        mainText2,
                        style: GoogleFonts.aBeeZee(
                            fontSize: screenSize.width *
                                0.05, // Adjust for screen size
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        mainParagraph,
                        style: GoogleFonts.aBeeZee(
                            fontSize: screenSize.width *
                                0.04, // Adjust for screen size
                            color: Colors.black45,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height:
                            screenSize.height * 0.02, // Adjust for screen size
                      ),
                      InkWell(
                        onTap: () => null,
                        onHover: (hovering) {
                          setState(() => isHoveringContainer = hovering);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          padding: EdgeInsets.all(isHoveringContainer ? 10 : 8),
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
                              ]),
                          child: Text(
                            "Book a Trip",
                            style: GoogleFonts.yujiSyuku(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: screenSize.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.03),
                    child: CustomRoadContainerMobile(
                      screenSize: screenSize.width,
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  // color: Colors.pink,
                  width: screenSize.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.01),
                    child: CustomAdvContainerMobile(
                      screenSize: screenSize.width,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
