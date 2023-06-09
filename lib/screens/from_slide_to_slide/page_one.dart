



import 'package:animation/screens/from_slide_to_slide/page_two.dart';
import 'package:animation/screens/from_slide_to_slide/pageroute.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color:Colors.lightGreen,
        child: Center(
          child: ElevatedButton(onPressed: (){
            Navigator.push(context,Slide(page:PageTwo()) );
          }, child: Text('pagetwo'),),
        ),
      ),
    );
  }
}
