import 'package:flutter/material.dart';
import 'package:web_project_flutter/helpers/style.dart';

class CustomRoadContainerMobile extends StatefulWidget {
  final double screenSize;
  CustomRoadContainerMobile({super.key, required this.screenSize});

  @override
  State<CustomRoadContainerMobile> createState() =>
      _CustomRoadContainerMobileState();
}

class _CustomRoadContainerMobileState extends State<CustomRoadContainerMobile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          containerWidget(
            "Destination",
            "Where to?",
            Icons.search,
            "Guest and Rooms",
            "2 Guests, 1 room",
            Icons.home,
            screenSize,
          ),
          containerWidget(
            "Check In",
            "10 Jan 2024",
            Icons.calendar_month,
            "Check Out",
            "20 Jan 2024",
            Icons.calendar_month,
            screenSize,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: active),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "SEARCH",
                style: TextStyle(fontSize: screenSize.width * 0.04),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
        ],
      ),
    );
  }

  Widget containerWidget(String text1, String text2, IconData icon,
      String text3, String text4, IconData icon2, Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.grey,
            onTap: () => print("Container pressed"),
            child: Container(
              padding: EdgeInsets.all(screenSize.width * 0.025),
              child: Row(
                children: [
                  Icon(icon,
                      color: Colors.black, size: screenSize.width * 0.06),
                  SizedBox(width: screenSize.width * 0.02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screenSize.width * 0.035),
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenSize.width * 0.04),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.grey,
            onTap: () => print("Container pressed"),
            child: Container(
              padding: EdgeInsets.all(screenSize.width * 0.025),
              child: Row(
                children: [
                  Icon(icon2,
                      color: Colors.black, size: screenSize.width * 0.06),
                  SizedBox(width: screenSize.width * 0.02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text3,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: screenSize.width * 0.035),
                      ),
                      Text(
                        text4,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenSize.width * 0.04),
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
