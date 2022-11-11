import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/UI/Screens/Character.dart';
import 'package:new_project/UI/Screens/bottomnavigation.dart';
import 'package:new_project/UI/Screens/login.dart';
import 'package:onboarding_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  AwesomeNotifications().initialize('resource://drawable/award1', [
    // notification icon
    NotificationChannel(
      channelGroupKey: 'basic_test',
      channelKey: 'basic',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      channelShowBadge: true,
      importance: NotificationImportance.High,
      enableVibration: true,
    ),

    NotificationChannel(
        channelGroupKey: 'image_test',
        channelKey: 'image',
        channelName: 'image notifications',
        channelDescription: 'Notification channel for image tests',
        defaultColor: Colors.redAccent,
        ledColor: Colors.white,
        channelShowBadge: true,
        importance: NotificationImportance.High)

    //add more notification type with different configuration
  ]);

  late final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );
  print(settings.authorizationStatus);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      //no permission of local notification
      AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      //show notification
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        //simgple notification
        id: 123,
        channelKey: 'basic', //set configuration wuth key "basic"
        title: message.notification!.title,
        body: message.notification!.body,
      ));
    }
    // Parse the message received
    // PushNotification notification = PushNotification(
    //   title: message.notification?.title,chr
    //   body: message.notification?.body,
    // );
    // print(notification.title);
    // print(notification.body);
  });

  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  await prefs.setInt("onBoard", 0);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Assignmnet',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EasySplashScreen(
          logo: Image.asset('assets/Images/welcome3.png'),
          title: Text(
            "My App",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          showLoader: true,
          loadingText: Text("Loading..."),
          navigator: isviewed != 0 ? OnboardScreen() : PhoneAuthForm(),
          durationInSeconds: 5,
        ));
  }
}

class OnboardScreen extends StatelessWidget {
  final List<_SliderModel> mySlides = [
    _SliderModel(
      imageAssetPath: Image.asset(
        'assets/Images/welcome.png',
        scale: 1,
      ),
      title: 'Hello,You Are Welcomed Warmly',
      desc: '',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/Images/welcome2.png'),
      title: 'Have a Nice Stay Here',
      // desc: 'discover people',
    ),
  ];
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      label: const Text(
        'Get Started',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      function: () {
        print('Navigation');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      mySlides: mySlides,
      controller: _controller,
      slideIndex: 0,
      statusBarColor: Color.fromARGB(255, 255, 254, 254),
      startGradientColor: Color.fromARGB(255, 255, 254, 254),
      endGradientColor: Color.fromARGB(255, 255, 254, 254),
      skipStyle: TextStyle(color: Color.fromARGB(0, 249, 168, 38)),
      pageIndicatorColorList: [
        //  Color.fromARGB(255, 68, 47, 185),
        // Colors.green,
        // Colors.red,
        Colors.yellow,
        Color.fromARGB(255, 4, 228, 224)
      ],
    );
  }
}

class _SliderModel {
  const _SliderModel({
    required this.imageAssetPath,
    this.title = "",
    this.desc = "",
    // ignore: unused_element
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    this.titleStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  });

  final Image imageAssetPath;
  final String title;
  final TextStyle titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle descStyle;
  final double miniDescFontSize;
}
