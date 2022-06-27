import 'package:flutter/material.dart';
import 'package:google_adds/native_ad_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAddClass extends StatefulWidget {
  const BannerAddClass({Key? key}) : super(key: key);

  @override
  State<BannerAddClass> createState() => _BannerAddClassState();
}

class _BannerAddClassState extends State<BannerAddClass> {
  BannerAd? bannerAd;
  bool isLoaded = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isLoaded = true;
        });
        print('is loaded is loaded is loaded is loaded');
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
      request: const AdRequest(),
    );
    bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Banner Adds')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        isLoaded
            ? SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: AdWidget(
                  ad: bannerAd!,
                ),
              )
            : const Center(child: Text('Add Not Loaded'))
      ]),
    );
  }
}
