import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_project_flutter/constants/constants.dart';

class CustomAdvContainerMobile extends StatefulWidget {
  final double screenSize;
  CustomAdvContainerMobile({super.key, required this.screenSize});

  @override
  State<CustomAdvContainerMobile> createState() =>
      _CustomAdvContainerMobileState();
}

class _CustomAdvContainerMobileState extends State<CustomAdvContainerMobile> {
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  bool _isHovering3 = false;
  bool _isHovering4 = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;

    return Container(
      width: screenSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildHoverContainer(titleadv1, adv1_path, _isHovering1,
                  (hovering) {
                setState(() {
                  _isHovering1 = hovering;
                });
              }, screenSize),
              buildHoverContainer(titleadv2, adv2_path, _isHovering2,
                  (hovering) {
                setState(() {
                  _isHovering2 = hovering;
                });
              }, screenSize),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildHoverContainer(titleadv3, adv3_path, _isHovering3,
                  (hovering) {
                setState(() {
                  _isHovering3 = hovering;
                });
              }, screenSize),
              buildHoverContainer(titleadv4, adv4_path, _isHovering4,
                  (hovering) {
                setState(() {
                  _isHovering4 = hovering;
                });
              }, screenSize),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHoverContainer(String title, String imagePath, bool isHovering,
      Function(bool) onHover, double screenSize) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        // margin: EdgeInsets.all(5), // Margin for spacing
        // padding: EdgeInsets.all(8),
        width: isHovering ? screenSize / 4 : screenSize / 4.5,
        height: isHovering ? screenSize / 4 : screenSize / 4.5,
        decoration: BoxDecoration(
          color: isHovering ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isHovering
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: screenSize / 10,
              height: screenSize / 10,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: screenSize * 0.03,
                fontWeight: FontWeight.bold,
                color: isHovering ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
