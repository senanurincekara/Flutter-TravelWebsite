import 'package:flutter/material.dart';
import 'package:web_project_flutter/helpers/style.dart';

class CustomRoadContainer extends StatefulWidget {
  final double screenSize;
  CustomRoadContainer({super.key, required this.screenSize});

  @override
  State<CustomRoadContainer> createState() => _CustomRoadContainerState();
}

class _CustomRoadContainerState extends State<CustomRoadContainer> {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen width
    var screenWidth = MediaQuery.of(context).size.width;
    var isSmallScreen = screenWidth < 600; // Define a breakpoint

    return Container(
      width: widget.screenSize,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: isSmallScreen
          ? Column(
              // For smaller screens, use a Column layout
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                containerWidget("Destination", "Where to?", Icons.search),
                containerWidget(
                    "Check In", "10 Jan 2024", Icons.calendar_month),
                containerWidget(
                    "Check Out", "20 Jan 2024", Icons.calendar_month),
                containerWidget(
                    "Guest and Rooms", "2 Guests, 1 room", Icons.home),
                searchButton(),
              ],
            )
          : Row(
              // For larger screens, use a Row layout
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                containerWidget("Destination", "Where to?", Icons.search),
                containerWidget(
                    "Check In", "10 Jan 2024", Icons.calendar_month),
                containerWidget(
                    "Check Out", "20 Jan 2024", Icons.calendar_month),
                containerWidget(
                    "Guest and Rooms", "2 Guests, 1 room", Icons.home),
                searchButton(),
              ],
            ),
    );
  }

  // Reusable widget method
  Widget containerWidget(String text1, String text2, IconData icon) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () => print("Container pressed"),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(color: Colors.black45),
                ),
                Text(
                  text2,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Search button widget
  Widget searchButton() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2, color: active),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "SEARCH",
          style: TextStyle(color: active, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
