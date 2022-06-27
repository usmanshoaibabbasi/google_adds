import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdClass extends StatefulWidget {
  const NativeAdClass({Key? key}) : super(key: key);

  @override
  State<NativeAdClass> createState() => _NativeAdClassState();
}

class _NativeAdClassState extends State<NativeAdClass> {
  late NativeAd _ad;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    print('init state');
    loadNativeAd();
  }

  ///Important make sure to dispose the ad when disposing the screen
  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }
  void loadNativeAd() {
    _ad = NativeAd(
        request: const AdRequest(),
        ///This is a test adUnitId make sure to change it
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        factoryId: 'listTile',
        listener: NativeAdListener(
            onAdLoaded: (ad){
              setState(() {
                isLoaded = true;
              });
            },
            onAdFailedToLoad: (ad, error){
              ad.dispose();
              print('failed to load the ad ${error.message}, ${error.code}');
            }
        )
    );

    _ad.load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Native Ad'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    if(isLoaded && index == 3){
                      return Container(
                        child: AdWidget(ad: _ad,),
                        alignment: Alignment.center,
                        height: 170,
                        color: Colors.black12,
                      );
                    }else{
                      return ListTile(
                        title: Text('Item ${index + 1}'),
                        leading: const FlutterLogo(size: 25,),
                        subtitle: Text('Sub Title for item ${index + 1}'),
                      );
                    }

                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class Adds2Screen extends StatefulWidget {
//   const Adds2Screen({Key? key}) : super(key: key);
//
//   @override
//   State<Adds2Screen> createState() => _Adds2ScreenState();
// }
//
// class _Adds2ScreenState extends State<Adds2Screen> {
//   late NativeAd _ad;
//   bool isLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadNativeAd();
//   }
//
//   ///Important make sure to dispose the ad when disposing the screen
//   @override
//   void dispose() {
//     _ad.dispose();
//     super.dispose();
//   }
//   void loadNativeAd() {
//     _ad = NativeAd(
//         request: const AdRequest(),
//         ///This is a test adUnitId make sure to change it
//         adUnitId: 'ca-app-pub-3940256099942544/2247696110',
//         factoryId: 'listTile',
//         listener: NativeAdListener(
//             onAdLoaded: (ad){
//               setState(() {
//                 isLoaded = true;
//               });
//             },
//             onAdFailedToLoad: (ad, error){
//               ad.dispose();
//               print('failed to load the ad ${error.message}, ${error.code}');
//             }
//         )
//     );
//
//     _ad.load();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Native Ad'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Expanded(
//           child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index){
//                 if(isLoaded && index== 3){
//                   return Container(
//                     child: AdWidget(ad: _ad,),
//                     alignment: Alignment.center,
//                     height: 170,
//                     color: Colors.black12,
//                   );
//                 }else{
//                   return ListTile(
//                     title: Text('Item ${index + 1}'),
//                     leading: const FlutterLogo(size: 25,),
//                     subtitle: Text('Sub Title for item ${index + 1}'),
//                   );
//                 }
//
//               }
//           ),
//         ),
//       ),
//     );
//   }
// }
