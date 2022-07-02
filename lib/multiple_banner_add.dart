import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_adds/helper/admob_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MultipleBannerAdd extends StatefulWidget {
  const MultipleBannerAdd({Key? key}) : super(key: key);

  @override
  State<MultipleBannerAdd> createState() => _MultipleBannerAddState();
}

class _MultipleBannerAddState extends State<MultipleBannerAdd> {
  late List<String> datas;
  late List<Object> dataads;
  @override
  void initState() {
    super.initState();
    datas = [];
    for (int i = 1; i < 20; i++) {
      datas.add("List Item $i");
    }
    dataads = List.from(datas);
    for (int i = 0; i < 3; i++) {
      var min = 1;
      var rm = Random();
      var rannumpos = min + rm.nextInt(18);
      dataads.insert(rannumpos, AdMobHelper.getBannerAd()..load());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Multiple Banner Ad')),
      ),
      body: ListView.builder(
          itemCount: dataads.length,
          itemBuilder: (context, index) {
            if (dataads[index] is String) {
              return ListTile(
                title: Text(dataads[index].toString()),
                leading: const Icon(Icons.exit_to_app),
                trailing: const Icon(Icons.ice_skating),
              );
            } else {
              final SizedBox adcontent = SizedBox(
                child: AdWidget(
                  ad: dataads[index] as BannerAd,
                  key: UniqueKey(),
                ),
                height: 90,
              );
              return adcontent;
            }
          }),
    );
  }
}
