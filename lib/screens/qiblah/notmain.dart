import 'package:animation/screens/qiblah/loading_indicator.dart';
import 'package:animation/screens/qiblah/qiblah_compass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class qiblahh extends StatefulWidget {
  @override
  _qiblahhState createState() => _qiblahhState();
}

class _qiblahhState extends State<qiblahh> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c7b93),
        primaryColorLight: Color(0xff00a8cc),
        primaryColorDark: Color(0xff27496d),
        accentColor: Color(0xffecce6d),
      ),
      darkTheme: ThemeData.dark().copyWith(accentColor: Color(0xffecce6d)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
            if (snapshot.data!) {
              return QiblahCompass();
            } else {
              return Container();
              // QiblahMaps();
            }
          },
        ),
      ),
    );
  }
}
