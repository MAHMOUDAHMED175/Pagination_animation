import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:glassmorphism/glassmorphism.dart';
Widget glassCard(var context) {
  double textScaleFactor = MediaQuery.textScaleFactorOf(context);
  return GlassmorphicFlexContainer(
      // flex: 2,
      borderRadius: 50,
      padding: EdgeInsets.all(25),
      blur: 14,
      alignment: Alignment.bottomCenter,
      border: 20,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey.withOpacity(0.5),
          Colors.orange.withOpacity(1),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey.withOpacity(1),
          Color(0xFF0FFFF).withOpacity(1),
          Colors.grey.withOpacity(1),
        ],
      ),
      child: Column(
        key: UniqueKey(),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                Image.network(
                  "https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi",
                  scale: 1.7,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                InkWell(
                  onTap: () {
                    // launchPubDev();
                  },
                  child: Text(
                    'pac',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 24.0 / textScaleFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Text(
                  "Published on ",
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 16.0 / textScaleFactor,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Published by Ritick Saha\n(The Flutter Foundry)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontStyle: FontStyle.italic,
                    fontSize: 16.0 / textScaleFactor,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    text:'llllllllllllll',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 26.0 / textScaleFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nLikes',
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 15.0 / textScaleFactor,
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'popularity%',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontSize: 26.0 / textScaleFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nPopularity',
                        style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 15.0 / textScaleFactor,
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Small Package Discription:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontStyle: FontStyle.italic,
                    fontSize: 18.0 / textScaleFactor,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "hhhhhhhhhhhhhhhhhhhhh",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      fontStyle: FontStyle.italic,
                      fontSize: 18.0 / textScaleFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              ],
            ),
          ),
        ],
      ));
}
class Shimmers extends StatelessWidget {
  const Shimmers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset('assets/kkk.json'),
            SizedBox(
                height:600,
                child: glassCard(context)),

            SizedBox(
              height: 400,
              child: Column(
                children: [
                  GlassmorphicFlexContainer(
                    borderRadius: 50,
                    blur: 20,
                    padding: EdgeInsets.all(40),
                    alignment: Alignment.bottomCenter,
                    border: 20,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey.withOpacity(0.2),
                          Colors.white30.withOpacity(0.2),
                        ],
                        stops: [
                          1,0.8,

                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: null,
                  ),
                ],
              ),
            ),
        GlassmorphicContainer(
            width: 300,
            height: 300,
            borderRadius:50.0,
            blur: 2.0,
            alignment: Alignment.center,
            border:20,
            linearGradient: LinearGradient(colors: [Colors.lightBlueAccent,Colors.orange,Colors.red]),

            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.8),
                Color((0xFFFFFFFF)).withOpacity(0.2),
              ],
            ),
            child: Text('data')),
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
            CachedNetworkImage(
              imageUrl:
                  'https://img.freepik.com/premium-photo/image-colorful-galaxy-sky-generative-ai_791316-9864.jpg',
              height: 280,

              placeholder: (context, url) =>
                  Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.black,
                      period: const Duration(seconds: 1),
                      direction: ShimmerDirection.ltr,
                      // enabled: true,
                      // loop: 4,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                          ),
                          const Icon(
                            Icons.shield_moon,
                            size: 180,
                          ),
                          const Text(
                            'Shimmer',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              cacheManager: CacheManager(Config('customCacheKey',
                  stalePeriod: const Duration(days: 70))),
              errorWidget: (context, url, error) => const Text(
                'Error',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              // progressIndicatorBuilder: (context, url, downloadProgress) =>
              //     CircularProgressIndicator(value: downloadProgress.progress),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({super.key});

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const BannerPlaceholder(),
                const TitlePlaceholder(width: double.infinity),
                const SizedBox(height: 16.0),
                const ContentPlaceholder(
                  lineType: ContentLineType.threeLines,
                ),
                const SizedBox(height: 16.0),
                const TitlePlaceholder(width: 200.0),
                const SizedBox(height: 16.0),
                const ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
                const SizedBox(height: 16.0),
                const TitlePlaceholder(width: 200.0),
                const SizedBox(height: 16.0),
                const ContentPlaceholder(
                  lineType: ContentLineType.twoLines,
                ),
              ],
            ),
          )),
    );
  }
}

class SlideToUnlockPage extends StatelessWidget {
  final List<String> days = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  SlideToUnlockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final int hour = time.hour;
    final int minute = time.minute;
    final int day = time.weekday;
    final int month = time.month;
    final int dayInMonth = time.day;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide To Unlock'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 48.0,
            right: 0.0,
            left: 0.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '${hour < 10 ? '0$hour' : '$hour'}:${minute < 10 ? '0$minute' : '$minute'}',
                    style: const TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text(
                    '${days[day - 1]}, ${months[month - 1]} $dayInMonth',
                    style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 32.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/chevron_right.png',
                          height: 20.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                        ),
                        const Text(
                          'Slide to unlock',
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  final double width;

  const TitlePlaceholder({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 60.0,
            color: Colors.white,
          ),
          const SizedBox(height: 8.0),
          Container(
            width: width,
            height: 12.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96.0,
            height: 72.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
