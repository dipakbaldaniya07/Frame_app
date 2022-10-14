import 'package:festival_frame/screens/frames.dart';
import 'package:festival_frame/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:festival_frame/screens/allscreen.dart';
import 'package:festival_frame/screens/framepage.dart';
import 'package:festival_frame/screens/frameselect.dart';
import 'package:festival_frame/screens/setimage.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'screens/imagepage.dart';
import 'screens/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen',
      routes: {
        "splashscreen": (context) => const SplashScreen(),
        "dashboard": (context) => const DashBoard(),
        "setimage": (context) => const SetImage(),
        "/": (context) => const MyHomePage(),
        "framepage": (context) => const FramePage(),
        "select_frame": (context) => const SelectFrame(),
        "imagepage": (context) => const AlbumPage(),
        "setting": (context) => const Setting(),
        "sticker": (context) => const StickerPage(),
        "frames": (context) => const Frames(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  final List _pages = [
    const DashBoard(),
    const AlbumPage(),
    const Setting(),
  ];
  void onItemSelected(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedPage,
        showElevation: true,
        itemCornerRadius: 24,
        onItemSelected: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        curve: Curves.easeIn,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.dashboard),
            title: const Text("Dash Board"),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.auto_mode_rounded),
            title: const Text("Story"),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Settings"),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
