import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../controller/location_controller.dart';
import '../../controller/weather_controller.dart';
import '../core/constants.dart';
import '../home/home_page.dart';
import '../search/search.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final WeatherController weatherControl = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 123, 188, 241),
        Color.fromARGB(255, 108, 124, 214),
        Color.fromARGB(255, 103, 79, 225),
        Color.fromARGB(255, 98, 72, 232),
        Color.fromARGB(255, 83, 55, 218),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Weather App', style: splashTxtStyle),
              sbHeight20,
              GetBuilder<LocationController>(
                  init: LocationController(),
                  builder: (_locCtrl) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: whiteColor),
                        onPressed: () async {
                          Position usrLocation =
                              await _locCtrl.getLocationData();
                          await weatherControl.getWeatherData(
                              userLocation: usrLocation);
                          await Get.offAll(() => HomePage());
                        },
                        child: _locCtrl.isLocationLoading
                            ? const CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : const Text('Auto fetch Location'));
                  }),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SearchPage());
                  },
                  child: const Text('Select Manually Location')),
              const SizedBox(
                height: 16,
              ),
              // ElevatedButton(
              //   onPressed: () async {
              // FirebaseAuth.instance.signInAnonymously();
              // var res = await FirebaseAuth.instance
              //     .createUserWithEmailAndPassword(
              //         email: "Yogi@gmail.com", password: "cutegirl@123");
              // var res = await FirebaseAuth.instance
              //   .signInWithEmailAndPassword(
              //     email: "Yogi@gmail.com", password: "cutegirl@123");

              // print(res);
              // },
              //child: const Text('Login Anonymous'))
            ],
          )),
        ),
      ),
    );
  }
}
