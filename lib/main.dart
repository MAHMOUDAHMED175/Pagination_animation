import 'package:flutter/material.dart';

import 'screens/notification/awsome_local_notification/notification1.dart';
import 'screens/notification/awsome_local_notification/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  // await DioHelper.Init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      navigatorKey: navigatorKey,
      home:
          // Containerr(),
          // Cube(),
          // ThreeDDrawer(),
          // Pagination(),
          // const AlertAnimate(),
          // ContainerRotate(),
          //   const ProfileImageMove(),
          // const Shimmers(),
          // SlideToUnlockPage(),
          // qiblahh(),
          // const Compass(),
          // const Location(),
          // QiblahMaps(),
          // PrayTimes(),
          NotificationAwesome(),
    );
  }
}
