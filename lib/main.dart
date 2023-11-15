import 'dart:async';

import 'package:camera/camera.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pictotalk/views/selection_screen.dart';
import 'firebase_options.dart';
import 'package:pictotalk/views/selection_screen_second.dart';
import 'package:pictotalk/views/splash_screen.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Permission.camera.request();

  await Permission.audio.request();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    Widget customHomeScreen() {
      if (user == null) {
        return SelectionScreen(
          name: 'sandesh',
        );
      } else {
        return const SelectionScreenSecond();
      }
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PicTalk',
        home: customHomeScreen());
  }
}
