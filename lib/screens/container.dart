import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Containerr extends StatefulWidget {
  @override
  State<Containerr> createState() => _ContainerrState();
}

class _ContainerrState extends State<Containerr> {
  double fs = 10;
  double op = 0;
  BoxShape boxsh = BoxShape.circle;
  Color col = Colors.cyanAccent;
  double ele = 50;
  Color shcol = Colors.white;

  double r = 80;
  double t = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
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
                child: Stack(children: [
                  AnimatedPositioned(
                      duration: const Duration(seconds: 3),
                      right: r,
                      top: t,
                      onEnd: () {
                        setState(() {
                          r = 250;
                          t = 200;
                        });
                      },
                      child: Container(
                        color: Colors.yellow,
                        height: 100,
                        width: 100,
                        child: const Text('data'),
                      )),
                ]),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    r = 60;
                    t = 20;
                  });
                },
                child: const Text('change'),
              ),



































                  Text("Helpppppppppppppppppppppppppppplo",style: TextStyle(color: Colors.brown),
                  ).animate().fadeIn(duration: 600.ms)
                      .callback(
                      duration: 2.seconds, callback: (_) => print('halfway')),



                  // Text("Hello",style: TextStyle(color: Colors.white),).animate().fadeIn(curve: Curves.linear)
                  //     .listen(callback: (value) => print('current opacity: $value')),











              Text(
                "Horrible Pulsing Text",
                style: TextStyle(color: Colors.white),
              )
                  .animate(
                  onPlay: (controller) => controller.repeat(reverse: true))
                  .fadeOut(curve: Curves.easeInOut),

              Text(
                "Hello World",
                style: TextStyle(color: Colors.white),
              ).animate().custom(
                  duration: 80000.ms,
                  builder: (context, value, child) =>
                      Container(
                        color: Color.lerp(Colors.red, Colors.blue, value),
                        padding: EdgeInsets.all(8),
                        child: child, // child is the Text widget being animated
                      )),

              Text(
                "Before",
                style: TextStyle(color: Colors.white),
              ).animate().swap(
                  duration: 9000.ms,
                  builder: (_, __) =>
                      Text(
                        "After",
                        style: TextStyle(color: Colors.white),
                      )),

              Column(
                  children: AnimateList(
                    interval: 4000.ms,
                    effects: [FadeEffect(duration: 300.ms)],
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "World",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Goodbye",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
// or shorthand:
              Column(
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "World",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Goodbye",
                    style: TextStyle(color: Colors.white),
                  )
                ].animate(interval: 4000.ms).fade(duration: 300.ms),
              ),
              Text(
                "Hello",
                style: TextStyle(color: Colors.white),
              )
                  .animate()
                  .fadeIn(duration: 6000.ms)
                  .then(delay: 20000.ms) // baseline=800ms
                  .slide(),
              Text(
                'Hello',
              ).animate().tint(color: Colors.purple),
              Text(
                "Hello",
                style: TextStyle(color: Colors.blueGrey
                ),
              )
                  .animate(
                delay: 1000.ms,
                // this delay only happens once at the very start
                onPlay: (controller) => controller.repeat(), // loop
              )
                  .fadeIn(delay: 500.ms)
              // this delay happens at the start of each loop,
              ,





                Animate(
                  effects: const [
                    FadeEffect(),
                    ShakeEffect(),
                    ScaleEffect(),
                    BlurEffect(),
                    FlipEffect(),
                    ColorEffect(
                        delay: Duration(seconds: 5), blendMode: BlendMode.xor)
                  ],
                  child: const Text(
                    "Hddddddddddddddddddddddddddddddddd",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                )
                    .animate()
                    .fade(delay: 50000.microseconds)
                    .scaleX(begin: 2, end: 4, delay: Duration(seconds: 3))
                    .moveY(
                    begin: 20, end: 40, delay: const Duration(seconds: 2)),
                ],
              )),
        ));
  }
}
