import 'package:flutter/material.dart';

class Containerr extends StatefulWidget {
  @override
  State<Containerr> createState() => _ContainerrState();
}

class _ContainerrState extends State<Containerr> {
  double fs = 10;
  double op = 0;
  BoxShape boxsh=BoxShape.circle;
  Color col=Colors.cyanAccent;
  double ele=50;
  Color shcol=Colors.white;

  double r=80;
  double t=80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
            // child:Transform.scale(
            //     scale:2,
            // child: Container(
            // width: 100,
            // height: 100,
            // color: Colors.red,
            // )
            // )

            // child:Transform.translate(
            //     offset: Offset(0.0, 400.0),
            //     child: Container(
            //       width: 100,
            //       height: 100,
            //       color: Colors.red,
            //     )
            // )

            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Transform.rotate(
        //   origin: Offset(50.0,0.0),
        //   angle:val,
        //   child: Container(
        //     width: 300,
        //     height: 100,
        //     color: Colors.red,
        //   ),
        // ),
        //
        // Transform.scale(
        //   scale:val,
        //من نقطه معينه
        //   origin: Offset(50.0,0.0),
        //   child: Container(
        //     width: 100,
        //     height: 300,
        //     color: Colors.red,
        //   ),
        // ),

        // Transform(
        //   transform: Matrix4.rotationX(3.14/3)..scale(2.0)..translate(-50.0),
        //   child: Container(
        //     width: 100,
        //     height: 300,
        //     color: Colors.red,
        //   ),
        // ),

        // AnimatedCrossFade(
        //   duration: Duration(seconds: 10),
        //   firstChild: Container(
        //     width: 100.0,
        //     height: 200.0,
        //     color: Colors.red,
        //   ),
        //   secondChild: Container(
        //     width: 300.0,
        //     height: 600.0,
        //     color: Colors.orange,
        //   ),
        //   firstCurve: Curves.linear,
        //   secondCurve:Curves.linear,
        //   crossFadeState:change? CrossFadeState.showFirst:CrossFadeState.showSecond,
        // ),

        // Container(
        //   color: Colors.yellow,
        //   child: AnimatedPadding(
        //     padding: EdgeInsets.all(fs),
        //     child: Text('data'),
        //     duration: Duration(seconds: 10),
        //     curve: Curves.linearToEaseOut,
        //   ),
        // ),

        /*
                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: op,
                  curve: Curves.linear,
                  onEnd: () {
                    setState(() {
                      fs=20;
                      op=0;
                    });
                  },
                  child: Container(
                    color: Colors.yellow,
                    child: AnimatedPadding(
                      padding: EdgeInsets.all(fs),
                      child: Text('data'),
                      duration: Duration(seconds: 10),
                      curve: Curves.linearToEaseOut,
                    ),
                  ),
                ),*/

        // AnimatedPhysicalModel(
        //     shape: boxsh,
        //     elevation: ele,
        //     color: col,
        //     shadowColor: shcol,
        //     curve: Curves.linear,
        //     duration: Duration(seconds: 3),
        //     onEnd: (){
        //       setState(() {
        //         boxsh=BoxShape.circle;
        //         col=Colors.yellow;
        //         ele=0;
        //         shcol=Colors.orange;
        //       });
        //     },
        //     child:  Container(
        //
        //       height: 200,
        //         width: 200,
        //       child: Text('data'),
        //     )),






        Container(
          height: 400,
          width: 400,
          color: Colors.red,
          child: Stack(

            children:[
              AnimatedPositioned(
                duration: Duration(seconds: 3),
                right: r,
                top: t,
                onEnd: (){
                  setState(() {
                    r=250;
                    t=200;
                  });
                },
                child:  Container(
                  color: Colors.yellow,
                  height: 100,
                  width: 100,
                  child: Text('data'),
                )),]
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              r=60;
              t=20;
            });
          },
          child: Text('change'),
        )
      ],
    )));
  }
}
