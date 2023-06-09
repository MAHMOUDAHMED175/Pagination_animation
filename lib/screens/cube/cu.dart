
import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;


const widthAndHeight = 100.0;

class Cube extends StatefulWidget {
  const Cube({Key? key}) : super(key: key);

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 8,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: widthAndHeight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                _xController,
                _yController,
                _zController,
              ]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      // back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(Vector3(0, 0, -widthAndHeight)),
                        child: Container(
                          width: widthAndHeight,
                          height: widthAndHeight,
                          decoration: const BoxDecoration(
                            color: Colors.purple,
                            boxShadow: [
                              BoxShadow(blurRadius:2000,color: Colors.purple,),
                              BoxShadow(blurRadius:2000,color: Colors.purple,),
                            ]
                          ),
                        ),
                      ),
                      // left side
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2.0),
                        child: Container(
                          width: widthAndHeight,
                          height: widthAndHeight,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(blurRadius:2000,color: Colors.red,),
                                BoxShadow(blurRadius:2000,color: Colors.red,),
                              ]
                          ),
                        ),
                      ),
                      // left side
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2.0),
                        child: Container(
                          width: widthAndHeight,
                          height: widthAndHeight,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(blurRadius:2000,color: Colors.blue,),
                                BoxShadow(blurRadius:2000,color: Colors.blue,),
                              ]
                          ),
                        ),
                      ),
                      // front
                      Container(
                        width: widthAndHeight,
                        height: widthAndHeight,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            boxShadow: [
                              BoxShadow(blurRadius:2000,color: Colors.green,),
                              BoxShadow(blurRadius:2000,color: Colors.green,),
                            ]
                        ),
                      ),
                      // top side
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2.0),
                        child: Container(
                          width: widthAndHeight,
                          height: widthAndHeight,
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              boxShadow: [
                                BoxShadow(blurRadius:2000,color: Colors.orange,),
                                BoxShadow(blurRadius:2000,color: Colors.orange,),
                              ]
                          ),
                        ),
                      ),
                      // bottom side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2.0),
                        child: Container(
                          width: widthAndHeight,
                          height: widthAndHeight, decoration:  const BoxDecoration(
                            color: Colors.brown,
                            image: DecorationImage(image: AssetImage('lib/screens/image.jpg',),fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(blurRadius:2000,color: Colors.brown,),
                              BoxShadow(blurRadius:2000,color: Colors.brown,),
                            ]
                        ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}