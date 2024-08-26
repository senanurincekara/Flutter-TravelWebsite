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
      // Container kullanarak özel bir başlık çubuğu ekliyoruz
      body: Column(
        children: [
          Container(
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.white, // Arka plan rengini ihtiyaca göre ayarlayın
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
                : NavBar(), // büyük ekranlar için NavBar kullanımı
          ),
          Expanded(
            child: // Sayfanın geri kalan içeriği buraya gelecek
                Container(
                    child: ResponsiveWidget(
              largeScreen: DesktopScreen(),
              smallScreen: MobileScreen(),
              mediumScreen: DesktopScreen(),
            )), // İçerik yerleşimi için boş bir container
          ),
        ],
      ),
      drawer: SideMenu(),
    );
  }
}
