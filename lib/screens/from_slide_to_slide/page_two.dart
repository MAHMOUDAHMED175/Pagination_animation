



import 'package:animation/screens/from_slide_to_slide/page_one.dart';
import 'package:animation/screens/from_slide_to_slide/pageroute.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color:Colors.red,
        child: Center(
          child: ElevatedButton(onPressed: (){
            Navigator.push(context,Slide(page:  PageOne()) );
          }, child: const Text('pageooooooooooooooooooooo'),),
        ),
      ),
    );
  }
}
