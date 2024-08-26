import 'package:flutter/material.dart';
import 'package:web_project_flutter/helpers/responsive.dart';
import 'package:web_project_flutter/pages/home/widgets/desktop.dart';
import 'package:web_project_flutter/pages/home/widgets/mobile.dart';
import 'package:web_project_flutter/widgets/drawer.dart';
import 'package:web_project_flutter/widgets/navbar_desktop.dart';
import 'package:web_project_flutter/widgets/navbar_mobile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: double.infinity,
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
            ),
            child: ResponsiveWidget.isSmallScreen(context)
                ? mobileNavBar(scaffoldKey)
                : NavBar(),
          ),
          Expanded(
            child: Container(
                child: ResponsiveWidget(
              largeScreen: DesktopScreen(),
              smallScreen: MobileScreen(),
              mediumScreen: DesktopScreen(),
            )),
          ),
        ],
      ),
      drawer: SideMenu(),
    );
  }
}
