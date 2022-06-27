import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_adds/helper/admob_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MultipleNativeAdd extends StatefulWidget {
  const MultipleNativeAdd({Key? key}) : super(key: key);

  @override
  State<MultipleNativeAdd> createState() => _MultipleNativeAddState();
}

class _MultipleNativeAddState extends State<MultipleNativeAdd> {
  late List<String> datas;
  late List<Object> dataads;
  bool loading = false;
  @override
  void initState() {
    setState(() {
      loading = true;
    });
    // TODO: implement initState
    super.initState();
    datas = [];
    for (int i = 1; i < 100; i++) {
      datas.add("List Item $i");
    }
    dataads = List.from(datas);
    for (int i = 6; i < 100; i+=6) {
      // var min = 1;
      // var rm = Random();
      // var rannumpos = min + rm.nextInt(18);
      dataads.insert(i, AdMobHelper.loadNativeAd()..load());
    }
    var a = 100/6;
    String b = a.toString();
    print(a.toString());
    print(b.toString().substring(0,b.indexOf('.')));

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Multiple Native Ad')),
      ),
      body:
          loading == false ?
      ListView.builder(
          itemCount: dataads.length,
          itemBuilder: (context, index) {
            if (dataads[index] is String) {
              return ListTile(
                title: Text(dataads[index].toString()),
                leading: const Icon(Icons.exit_to_app),
                trailing: const Icon(Icons.ice_skating),
              );
            } else {
              // if(dataads[index] != ) {
                final SizedBox adcontent = SizedBox(
                  child: AdWidget(
                    ad: dataads[index] as NativeAd,
                    key: UniqueKey(),
                  ),
                  height: 190,
                );
                return adcontent;
              //}
            // else {
            //     return Container(
            //       child: Text('Loading')
            //     );
            //   }
            }
          }):
              const Center(child: CircularProgressIndicator())
    );
  }
}
