import 'package:flutter/material.dart';
import 'package:web_project_flutter/helpers/style.dart';

Widget mobileNavBar(GlobalKey<ScaffoldState> key) => AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: active,
        onPressed: () {
          key.currentState?.openDrawer();
        },
      ),
      // title: Image.asset(
      //   "assets/images/logo.png",
      //   width: 50,
      //   height: 50,
      //   alignment: AlignmentDirectional.centerEnd,
      // ),
      // centerTitle: false,
      elevation: 0,
    );
