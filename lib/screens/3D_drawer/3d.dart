
import 'dart:ffi';

import 'package:animation/screens/3D_drawer/my_drawer_body_view.dart';
import 'package:flutter/material.dart';

class ThreeDDrawer extends StatelessWidget {
  const ThreeDDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SizedBox(
        width: double.infinity,
        child: MyDrawer3d(
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('content drawer'),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                  Text('  '),
                ],
              ),
            ),
          ),
          child:  Container(
            width: double.infinity,
              color: Colors.black12,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_a_photo,size: 50,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_a_photo,size: 50,),
                ), Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_a_photo,size: 50,),
                ), Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_a_photo,size: 50,),
                ),
                Text('content scaffold'),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_a_photo,size: 50,),
                ), Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_a_photo,size: 50,),
                ), Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add_a_photo,size: 50,),
                ),
              ],
            ),
      ),
    ),
    ),
    );
  }
}