import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_project_flutter/helpers/style.dart';
import 'package:web_project_flutter/widgets/custom_buttom.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<bool> _isHovering = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: bgColor,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDrawerItem("Pricing", 0),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            _buildDrawerItem("List Your Property", 1),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            _buildDrawerItem("Support", 2),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            _buildDrawerItem("Trips", 3),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            _buildDrawerItem("Sign In", 4),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            CustomButton(text: "Get The App")
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String text, int index) {
    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovering[index] = value;
        });
      },
      hoverColor: Colors.transparent,
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            text,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _isHovering[index] ? active : disable,
            ),
          ),
          const SizedBox(width: 15),
          Visibility(
            visible: _isHovering[index],
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                color: active,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
