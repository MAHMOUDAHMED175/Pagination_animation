import 'package:animation/screens/notification/awsome_local_notification/notification_service.dart';
import 'package:animation/screens/qiblah/qiblah_compass.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationAwesome extends StatefulWidget {
  const NotificationAwesome({Key? key}) : super(key: key);

  @override
  State<NotificationAwesome> createState() => _NotificationAwesomeState();
}

class _NotificationAwesomeState extends State<NotificationAwesome> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                child: Text(
                  'Normal',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'Normal',
                    body: 'NORMAL',
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                child: Text(
                  'Inbox',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  await NotificationService.showNotification(
                      title: 'Inbox',
                      body: 'Inbox',
                      notificationLayout: NotificationLayout.Inbox);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                child: Text(
                  'ProgressBar',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  await NotificationService.showNotification(
                    title: 'ProgressBar',
                    body: 'ProgressBar',
                    summary: 'ProgressBar',
                    notificationLayout: NotificationLayout.ProgressBar,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                child: Text(
                  'Massiging',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  int notificationId = 1;

                  // Timer.periodic(Duration(seconds: 7), (Timer createTimer) async {
                  //   await AwesomeNotifications().createNotification(
                  //     content: NotificationContent(
                  //       id: notificationId,
                  //       channelKey: 'channelKey',
                  //       title: 'Emojis are awesome too! ' +
                  //           Emojis.smile_face_with_tongue +
                  //           Emojis.smile_rolling_on_the_floor_laughing +
                  //           Emojis.emotion_red_heart,
                  //       body:
                  //       'Simple body with a bunch of Emojis! ${Emojis.transport_police_car} ${Emojis.animals_dog} ${Emojis.flag_UnitedStates} ${Emojis.person_baby}',
                  //       bigPicture:
                  //       'https://tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg',
                  //       notificationLayout: NotificationLayout.BigPicture,
                  //     ),
                  //     schedule: NotificationCalendar(
                  //       weekday: DateTime.now().weekday,
                  //       hour: DateTime.now().hour,
                  //       minute: DateTime.now().minute,
                  //       second: DateTime.now().second + 7,
                  //       millisecond: 0,
                  //       repeats: true,
                  //       preciseAlarm: true,
                  //     ),
                  //   );
                  // });
                  //
                  // Timer.periodic(Duration(seconds: 10), (Timer cancelTimer) async {
                  //   await AwesomeNotifications().cancel(notificationId);
                  // });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                child: Text(
                  'BigPicture',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  String localTimeZone =
                  await AwesomeNotifications().getLocalTimeZoneIdentifier();

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QiblahCompass()));

                  // await NotificationService.showNotification(
                  //   title: 'صلى على محمد',
                  //   body: 'اللهم صلى وسلم وبارك على محمد',
                  //   category: NotificationCategory.Reminder,
                  //   notificationLayout: NotificationLayout.BigPicture,
                  //   scheduled: NotificationCalendar(
                  //       second: 2, timeZone: localTimeZone, repeats: true),
                  //   bigPicture:
                  //       'https://modo3.com/thumbs/fit630x300/7185/1633590580/%D8%A7%D8%AC%D9%85%D9%84_%D8%B5%D9%84%D8%A7%D8%A9_%D8%B9%D9%84%D9%89_%D8%A7%D9%84%D9%86%D8%A8%D9%8A.jpg',
                  // );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                child: Text(
                  'schedual',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  await NotificationService.showNotification(
                      title: 'schedual',
                      body: 'schedual',
                      payload: {
                        'page': '/my_page',
                      },
                      actionButton: [
                        NotificationActionButton(
                          key: 'check',
                          label: 'check',
                          actionType: ActionType.Default,
                          color: Colors.green,
                        ),
                      ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
