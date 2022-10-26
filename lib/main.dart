import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/homepage.dart';
import 'package:onboarding_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          navigator: isviewed != 0 ? MyHomePage() : HomePage(),
          durationInSeconds: 5,
        ));
  }
}

class MyHomePage extends StatelessWidget {
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

      /// This function works when you will complete `OnBoarding`
      function: () {
        print('Navigation');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
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
