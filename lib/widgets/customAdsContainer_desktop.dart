import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_project_flutter/constants/constants.dart';

class CustomAdsContainerDesktop extends StatefulWidget {
  final double screenSize;
  CustomAdsContainerDesktop({super.key, required this.screenSize});

  @override
  State<CustomAdsContainerDesktop> createState() =>
      _CustomAdsContainerDesktopState();
}

class _CustomAdsContainerDesktopState extends State<CustomAdsContainerDesktop> {
  // Store the hover state for each container
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  bool _isHovering3 = false;
  bool _isHovering4 = false;

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen width
    var screenWidth = MediaQuery.of(context).size.width;
    var isSmallScreen =
        screenWidth < 800; // Define a breakpoint for small screens

    return Container(
      width: widget.screenSize,
      padding: EdgeInsets.symmetric(
          vertical: 20, horizontal: 10), // Add padding for spacing
      child: isSmallScreen
          ? Column(
              // For smaller screens, use a Column layout
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildHoverContainer(titleadv1, adv1_path, _isHovering1,
                    (hovering) {
                  setState(() {
                    _isHovering1 = hovering;
                  });
                }),
                buildHoverContainer(titleadv2, adv2_path, _isHovering2,
                    (hovering) {
                  setState(() {
                    _isHovering2 = hovering;
                  });
                }),
                buildHoverContainer(titleadv3, adv3_path, _isHovering3,
                    (hovering) {
                  setState(() {
                    _isHovering3 = hovering;
                  });
                }),
                buildHoverContainer(titleadv4, adv4_path, _isHovering4,
                    (hovering) {
                  setState(() {
                    _isHovering4 = hovering;
                  });
                }),
              ],
            )
          : Row(
              // For larger screens, use a Row layout
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildHoverContainer(titleadv1, adv1_path, _isHovering1,
                    (hovering) {
                  setState(() {
                    _isHovering1 = hovering;
                  });
                }),
                buildHoverContainer(titleadv2, adv2_path, _isHovering2,
                    (hovering) {
                  setState(() {
                    _isHovering2 = hovering;
                  });
                }),
                buildHoverContainer(titleadv3, adv3_path, _isHovering3,
                    (hovering) {
                  setState(() {
                    _isHovering3 = hovering;
                  });
                }),
                buildHoverContainer(titleadv4, adv4_path, _isHovering4,
                    (hovering) {
                  setState(() {
                    _isHovering4 = hovering;
                  });
                }),
              ],
            ),
    );
  }

  Widget buildHoverContainer(
      String title, String imagePath, bool isHovering, Function(bool) onHover) {
    return Flexible(
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10), // Adjusted margin for responsive spacing
          padding: EdgeInsets.all(10),
          width: isHovering ? 170 : 150, // Increase size on hover
          height: isHovering ? 170 : 150, // Increase size on hover
          decoration: BoxDecoration(
            color: isHovering ? Colors.red : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isHovering
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                child: Image(image: AssetImage(imagePath)),
              ),
              SizedBox(height: 10), // Space between image and text
              Text(
                title,
                style: GoogleFonts.aleo(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
