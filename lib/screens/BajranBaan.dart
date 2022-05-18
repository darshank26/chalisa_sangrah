
import 'dart:ffi';
import 'dart:ui';
import 'package:chalisa_sangrah/ChalisaData/bajran_baan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AdsHelper/adshelper.dart';
import '../ChalisaData/hanuman_chalisa.dart';
import '../utils/constants.dart';

class BajranBaan extends StatefulWidget {
  final int listIndex;

  const BajranBaan({Key? key,required this.listIndex}) : super(key: key);

  @override
  _BajranBaanState createState() => _BajranBaanState(listIndex);
}

class _BajranBaanState extends State<BajranBaan> {

  bool isLanguageSelected = false;

  final int listIndex;

  _BajranBaanState(this. listIndex);  //constructor

  List<String> lordNameHindi =
  [
    "|| श्री हनुमान चालीसा  ||",
    "|| श्री बजरंग बाण ||",
    "|| भगवान शिव ||",
    "|| भगवान श्री राम ||",
    "|| भगवान श्री कृष्ण ||",
    "|| भगवान हनुमान ||",
    "|| भगवान नरसिंह: ||",
    "|| भगवान श्री वेंकटेश्वर ||",
    "|| भगवान कुबेर ||",
    "|| भगवान शनि ||",
    "|| भगवान सत्य नारायण ||",
    "|| भगवान सूर्य ||",
    "|| भगवान चंद्र ||",
    "|| भगवान अयप्पा ||",
    "|| भगवान सुब्रह्मण्य ||",
    "|| भगवान सस्थ: ||",
    "|| देवी लक्ष्मी ||",
    "|| देवी दुर्गा ||",
    "|| देवी सरस्वती ||",
    "|| देवी सीता ||",
    "|| देवी गंगा ||",
    "|| देवी गायत्री ||",
    "|| देवी तुलसी ||"

  ];

  List<String> lordNameEnglish =
  ["|| Shri Hanuman Chalisa ||",
    "|| Shri Bajrang Baan ||",
    "|| Lord Shiva ||",
    "|| Lord Sri Rama ||",
    "|| Lord Sri Krishna ||",
    "|| Lord Hanuman ||",
    "|| Lord Narasimha ||" ,
    "|| Lord Venkateswara ||",
    "|| Lord Kubera ||",
    "|| Lord Shani ||",
    "|| Lord Satya Narayan ||",
    "|| Lord Surya ||",
    "|| Lord Chandra ||",
    "|| Lord Aiyappa ||",
    "|| Lord Subrahmanya ||",
    "|| Lord Sastha ||",
    "|| Goddess Lakshmi ||",
    "|| Goddess Durga ||",
    "|| Goddess Saraswati ||",
    "|| Goddess Sita ||",
    "|| Goddess Ganga ||",
    "|| Goddess Gayatri ||",
    "|| Goddess Tulsi ||",
  ];

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;
  // bool _getValue = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSwitchLanguage();


    // getPrefsData().then((value) =>
    // _getValue = value
    // );
    //
    // print(_getValue);

    // _bannerAd = BannerAd(
    //   adUnitId: AdHelper.bannerAdUnitIdOfBajranBaan,
    //   request: const AdRequest(),
    //   size: AdSize.banner,
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) {
    //       setState(() {
    //         _isBannerAdReady = true;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, err) {
    //       print('Failed to load a banner ad: ${err.message}');
    //       _isBannerAdReady = false;
    //       ad.dispose();
    //     },
    //   ),
    // );
    // _bannerAd.load();

  }

  Future<bool> getPrefsData() async {
    SharedPreferences   pref = await SharedPreferences.getInstance();
    bool? value = pref.getBool("switchState") ?? false;
    return value;
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // bool isLanguageSelected =  false;

    return Scaffold(
      backgroundColor: kmarroncolor,
      appBar:AppBar(
        backgroundColor: kprimarycolor,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text( isLanguageSelected ? lordNameHindi[listIndex] : lordNameEnglish[listIndex],
              style: GoogleFonts.poppins(
                  letterSpacing: 0.8, fontSize: 22, color: kmarroncolor,fontWeight: FontWeight.bold)),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right:5.0),
            child: IconButton(
              icon : isLanguageSelected ? const CircleAvatar(
                radius: 20,
                backgroundColor: kmarroncolor,child: Text('अ',style: TextStyle(color: kprimarycolor,fontSize: 18)),) : const CircleAvatar(
                radius: 20,
                backgroundColor: kmarroncolor,child: Text('A',style: TextStyle(color: kprimarycolor,fontSize: 18),),)   ,color: kmarroncolor, onPressed: () {
              _changeLanguage(isLanguageSelected);
            },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Expanded(
                    flex:1,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                  ),
                  Expanded(
                      flex:5,
                      child: Center(child: Image.asset("assets/images/bottom.png",height: 50,width: 300.0))),
                  Expanded(
                    flex:1,
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                  ),

                ],
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),




                  ],
                ),

                isLanguageSelected ?
                Expanded(
                    child:
                    Center(child:
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:  bajran_baan_hindi.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(bajran_baan_hindi[i] ,
                                      style: GoogleFonts.macondo(fontSize: 28, color: kprimarycolor,height: 1.70,letterSpacing: 1,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        );
                      },
                    )))
                    :
                Expanded(
                    child:
                    Center(child:
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: bajran_baan_english.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(bajran_baan_english[i] ,
                                      style: GoogleFonts.poppins(fontSize: 20, color: kprimarycolor,height: 2,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                                  ),
                                ),

                              ],
                            ),

                          ],
                        );
                      },
                    ))),

                Column(
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ), RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),
                    const SizedBox(height: 20.0,),
                    Image.asset("assets/images/side.png",height: 30,width: 30.0),
                    const SizedBox(height: 20.0,),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset("assets/images/bottom.png",height: 30,width: 200.0)),
                    ),



                  ],
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex:1,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                  ),
                  Expanded(
                      flex:5,
                      child: Center(child: Image.asset("assets/images/bottom.png",height: 50,width: 300.0))),
                  Expanded(
                    flex:1,
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/side.png",height: 30,width: 30.0)),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      // bottomNavigationBar: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     if (_isBannerAdReady)
      //       Container(
      //         width: _bannerAd.size.width.toDouble(),
      //         height: _bannerAd.size.height.toDouble(),
      //         child: AdWidget(ad: _bannerAd),
      //       ),
      //   ],
      // ),



    );

  }

  void _changeLanguage(bool value) {

    setState(() {
      if(value)
      {
        isLanguageSelected = false;
        saveSwitchState(value);
        print('Saved state is $isLanguageSelected');

      }else
      {
        isLanguageSelected = true;
        saveSwitchState(value);
        print('Saved state is $isLanguageSelected');
      }

    });
    print(isLanguageSelected);

  }
  //
  //
  void getSwitchLanguage() async{
    isLanguageSelected = (await getStoredPrefData())!;
    setState(() {});
  }
  // //
  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState", value);
    print('Switch Value saved $value');
    return prefs.setBool("switchState", value);
  }


  Future<bool?> getStoredPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLanguageSelected = prefs.getBool("switchState");
    print("----------------"+isLanguageSelected.toString());

    return isLanguageSelected;
  }
}
