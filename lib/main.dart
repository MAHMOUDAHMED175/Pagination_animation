import 'package:flutter/material.dart';

import 'screens/alert/alert.dart';
import 'screens/profile_image_move/profile_image_move.dart';
import 'screens/rotate_container/reotate_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:
          // Containerr(),
          // Cube(),
          // ThreeDDrawer(),
          // Pagination(),
          // const AlertAnimate(),
      // ContainerRotate(),
        const ProfileImageMove(),
    );
  }
}
