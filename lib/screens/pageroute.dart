// import 'package:flutter/cupertino.dart';
//
// class Slide extends PageRouteBuilder {
//   final page;
//
//   Slide({this.page})
//       : super(
//           transitionsBuilder: (context, animation, animationtwo, child)
//           {
//             var begin=const Offset(0.0,-1.0);
//             var end=Offset.zero;
//             var tween=Tween(begin: begin,end: end,);
//             var offsetAnimation=animation.drive(tween);
//             return SlideTransition(position: offsetAnimation,child: child,);
//
//           },
//           pageBuilder: (context, animation, animationtwo) => page,
//         );
// }


// import 'package:flutter/cupertino.dart';
//
// class Slide extends PageRouteBuilder {
//   final page;
//
//   Slide({this.page})
//       : super(
//           transitionsBuilder: (context, animation, animationtwo, child) {
//             var begin = const Offset(0.0, -1.0);
//             var end = Offset.zero;
//             var tween = Tween(
//               begin: begin,
//               end: end,
//             );
//             var curveanimation = CurvedAnimation(
//                 parent: animation, curve: Curves.linear);
//             return SlideTransition(
//               position: tween.animate(curveanimation),
//               child: child,
//             );
//           },
//           pageBuilder: (context, animation, animationtwo) => page,
//         );
// }


//
// import 'package:flutter/cupertino.dart';
//
// class Slide extends PageRouteBuilder {
//   final page;
//
//   Slide({this.page})
//       : super(
//     transitionsBuilder: (context, animation, animationtwo, child) {
//       var begin =  0.0;
//       var end = 1.0;
//       var tween = Tween(
//         begin: begin,
//         end: end,
//       );
//       var curveanimation = CurvedAnimation(
//           parent: animation, curve: Curves.linear);
//       return ScaleTransition(
//         scale: tween.animate(curveanimation),
//         child: child,
//       );
//     },
//     pageBuilder: (context, animation, animationtwo) => page,
//   );
// }


//
// import 'package:flutter/cupertino.dart';
//
// class Slide extends PageRouteBuilder {
//   final page;
//
//   Slide({this.page})
//       : super(
//     transitionsBuilder: (context, animation, animationtwo, child) {
//       var begin =  0.0;
//       var end = 1.0;
//       var tween = Tween(
//         begin: begin,
//         end: end,
//       );
//       var curveanimation = CurvedAnimation(
//           parent: animation, curve: Curves.easeInToLinear);
//       return RotationTransition(
//         turns: tween.animate(curveanimation),
//         child: child,
//       );
//     },
//     pageBuilder: (context, animation, animationtwo) => page,
//   );
// }
//


//
// import 'package:flutter/cupertino.dart';
//
// class Slide extends PageRouteBuilder {
//   final page;
//
//   Slide({this.page})
//       : super(
//     transitionsBuilder: (context, animation, animationtwo, child) {
//     return Align(alignment: Alignment.center,child:SizeTransition(sizeFactor: animation,child: child,));
//     },
//     pageBuilder: (context, animation, animationtwo) => page,
//   );
// }


// import 'package:flutter/cupertino.dart';
//
// class Slide extends PageRouteBuilder {
//   final page;
//
//   Slide({this.page})
//       : super(
//     transitionsBuilder: (context, animation, animationtwo, child) {
//       return FadeTransition(opacity: animation,child: child,);
//     },
//     pageBuilder: (context, animation, animationtwo) => page,
//   );
// }



//
// import 'package:flutter/cupertino.dart';
//
// class Slide extends PageRouteBuilder {
//   final page;
//
//   Slide({this.page})
//       : super(
//     transitionsBuilder: (context, animation, animationtwo, child) {
//       var begin = 0.0;
//       var end = 1.0;
//       var tween = Tween(
//         begin: begin,
//         end: end,
//       );
//       var curveanimation = CurvedAnimation(
//           parent: animation, curve: Curves.linear);
//       return ScaleTransition(
//         scale: tween.animate(curveanimation),
//         child: RotationTransition(
//           turns:tween.animate(curveanimation),
//           child: child,
//         ),
//       );
//     },
//     pageBuilder: (context, animation, animationtwo) => page,
//   );
// }








import 'package:flutter/cupertino.dart';

class Slide extends PageRouteBuilder {
  final page;

  Slide({this.page})
      : super(
    transitionsBuilder: (context, animation, animationtwo, child) {
      var begin =  0.0;
      var end = 1.0;
      var tween = Tween(
        begin: begin,
        end: end,
      );
      var curveanimation = CurvedAnimation(
          parent: animation, curve: Curves.linear);
      return ScaleTransition(
        scale: tween.animate(curveanimation),
        child: child,
      );
    },
    pageBuilder: (context, animation, animationtwo) => page,
  );
}
