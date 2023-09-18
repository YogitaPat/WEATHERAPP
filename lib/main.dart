import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application_assign/firebase_options.dart';
import 'package:weather_application_assign/view/auth/login_screen.dart';
import 'package:weather_application_assign/view/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              return (FirebaseAuth.instance.currentUser != null)
                  ? SplashScreen()
                  : const LoginScreen();
            }))

        //  (FirebaseAuth.instance.currentUser != null)
        //     ? SplashScreen()
        //     : const LoginScreen(),
        );
  }
}
