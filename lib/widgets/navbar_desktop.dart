import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_project_flutter/helpers/style.dart';
import 'package:web_project_flutter/widgets/custom_buttom.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _NavBarState extends State<NavBar> {
  final List<bool> _isHovering = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.02,
          vertical: screenSize.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          Image.asset(
            "assets/images/logo.png",
            width: 80,
            height: 80,
          ),
          Text(
            "Pass The World",
            style: GoogleFonts.turretRoad(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: screenSize.width / 8),
                _buildNavItem("Home", 0, screenSize),
                SizedBox(width: screenSize.width / 25),
                _buildNavItem("List Your Property", 1, screenSize),
                SizedBox(width: screenSize.width / 32),
                _buildNavItem("Support", 2, screenSize),
                SizedBox(width: screenSize.width / 44),
                _buildNavItem("Trips", 3, screenSize),
                SizedBox(width: screenSize.width / 56),
                _buildNavItem("Sign In", 4, screenSize),
                SizedBox(width: screenSize.width / 70),
                CustomButton(text: "Get The App")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text, int index, final screenSize) {
    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovering[index] = value;
        });
      },
      hoverColor: Colors.transparent,
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            text,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: _isHovering[index] ? active : disable,
            ),
          ),
          const SizedBox(height: 5),
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
