import 'package:flutter/material.dart';
import 'package:web_project_flutter/constants/constants.dart';

class ServicesContainerDesktop extends StatelessWidget {
  final double screenSizeWidth;

  const ServicesContainerDesktop({super.key, required this.screenSizeWidth});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0), // Added padding for better spacing
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    servicesTitle,
                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 24 : 30, // Adjust font size
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start, // Align text to the start
                  ),
                  SizedBox(height: 10),
                  ...services.map((service) {
                    return HoverableServiceItem(
                        service: service, screenWidth: screenWidth);
                  }).toList(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.06,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/5.png"),
                      ),
                      SizedBox(height: 8),
                      CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/6.png"),
                      ),
                    ],
                  ),
                  SizedBox(width: 16), // Added spacing between columns
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.09,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/7.png"),
                      ),
                      SizedBox(height: 8),
                      CircleAvatar(
                        radius: screenWidth * 0.05,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/8.png"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoverableServiceItem extends StatefulWidget {
  final Map<String, dynamic> service;
  final double screenWidth;

  const HoverableServiceItem(
      {super.key, required this.service, required this.screenWidth});

  @override
  _HoverableServiceItemState createState() => _HoverableServiceItemState();
}

class _HoverableServiceItemState extends State<HoverableServiceItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: _isHovered
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.5, color: Colors.black),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.red.withOpacity(0.5)]),
              )
            : null,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.service['id']}: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                Expanded(
                  child: Text(
                    widget.service['name'] ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              widget.service['description'] ?? '',
              style: TextStyle(
                color: Colors.black87,
                fontSize:
                    widget.screenWidth < 600 ? 14 : 16, // Adjust font size
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
