import 'package:flutter/material.dart';
import 'package:google_adds/multiple_banner_add.dart';
import 'package:google_adds/multiple_native_add.dart';
import 'package:google_adds/native_ad_screen.dart';
import 'package:google_adds/banner_ad_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool a = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Google Adds')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button(
              context: context,
              buttonColor: Colors.green,
              buttonText: 'Banner Ad',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BannerAddClass()),
                );
              }
          ),
          button(
            context: context,
            buttonColor: Colors.blueAccent,
            buttonText: 'Native Ad',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NativeAdClass()),
                );
              }
          ),
          button(
              context: context,
              buttonColor: Colors.deepPurple,
              buttonText: 'Multiple banner Ad',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MultipleBannerAdd()),
                );
              }
          ),
          button(
              context: context,
              buttonColor: Colors.orangeAccent,
              buttonText: 'Multiple Native Ads',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MultipleNativeAdd()),
                );
              }
          ),
        ],
      ),
    );
  }

  Widget button({
    required BuildContext context,
    required String buttonText,
    required Color buttonColor,
    required dynamic ontap,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: buttonColor,
        child: Center(child: Text
          (buttonText,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
