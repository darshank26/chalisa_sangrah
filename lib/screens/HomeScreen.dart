import 'dart:io';
import 'dart:ui';
import 'package:chalisa_sangrah/screens/BajranBaan.dart';
import 'package:chalisa_sangrah/screens/HanumanChalisa.dart';
import 'package:chalisa_sangrah/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:launch_review/launch_review.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../AdsHelper/adshelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLanguageSelected = false;


  List<String> aarthilistHindi =
  [
    "|| श्री हनुमान चालीसा || ",
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

  List<String> aarthilistEnglish =
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

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  Future<void>? _launched;

  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSwitchLanguage();


    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfHomeScreen,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();

  }


  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'http://darshankomu.com/apps/Marathi%20Aarti%20Sangrah/privacypolicy.html';

    return Scaffold(
      backgroundColor: kmarroncolor,
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: Align(
          alignment: Alignment.center,
          child: Text("Chalisa Sangrah",
              style: GoogleFonts.aclonica(
                  letterSpacing: 0.8,
                  fontSize: 24,
                  color: kmarroncolor,
                  fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        actions:  [
          Padding(
            padding: EdgeInsets.only(right:10.0),
            child: IconButton(

              icon : isLanguageSelected ? const CircleAvatar(
                radius: 20,
                backgroundColor: kmarroncolor,child: Text('A',style: TextStyle(color: kprimarycolor,fontSize: 18),),) : const CircleAvatar(
                radius: 20,
                backgroundColor: kmarroncolor,child: Text('अ',style: TextStyle(color: kprimarycolor,fontSize: 18)),)  ,color: kmarroncolor, onPressed: () {
                _changeLanguage(isLanguageSelected);
            },
                ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: aarthilistEnglish.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: DecoratedBox(
                        decoration:
                        ShapeDecoration(shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                            color: kprimarycolor.withOpacity(0.9)),
                        child: OutlinedButton(
                          onPressed: () =>
                          {
                            if(i == 0)
                              {
                                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HanumanChalisa(listIndex: i,)))
                              }
                            else if(i == 1)
                              {
                                Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: BajranBaan(listIndex: i,)))
                              }


                          },
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                                color: koutlinecolor.withOpacity(0.9),
                                width: 1.0,
                                style: BorderStyle.solid)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset("assets/images/side.png",scale: 4.5,color: kmarroncolor,),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            Column(
                                              children: [
                                                isLanguageSelected ?
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Text(aarthilistEnglish[i].toString(),
                                                      style: GoogleFonts.openSans(
                                                        fontSize: 19,
                                                        color: kmarroncolor,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                      softWrap: false,
                                                      overflow: TextOverflow.fade,
                                                      textAlign: TextAlign.center,),
                                                  ),
                                                ):
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(aarthilistHindi[i].toString(),
                                                    style: GoogleFonts.openSans(
                                                      fontSize: 22,
                                                      color: kmarroncolor,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,),
                                                )

                                              ],
                                            ),

                                            // Image.asset('assets/images/bottom.png',
                                            //   height: 20,width: 300.0, ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset("assets/images/side.png",scale: 4.5,color: kmarroncolor,),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  );
                },
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) =>
            FabCircularMenu(
              key: fabKey,
              alignment: Alignment.bottomRight,
              ringColor: kmarroncolor.withAlpha(190),
              ringDiameter: 400.0,
              ringWidth: 100.0,
              fabSize: 64.0,
              fabElevation: 24.0,
              fabIconBorder: const CircleBorder(),
              fabColor: ksecondcolor,
              fabOpenIcon: const Icon(
                Icons.home, color: kmarroncolor, size: 28,),
              fabCloseIcon: const Icon(
                Icons.close, color: kmarroncolor, size: 28,),
              fabMargin: const EdgeInsets.all(16.0),
              animationDuration: const Duration(milliseconds: 500),
              animationCurve: Curves.easeInOutCirc,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    _launched = _launchInBrowser(toLaunch);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(

                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.privacy_tip, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    if (Platform.isAndroid) {
                      // Android-specific code
                      Share.share(
                          androidShareText + '\n' + androidAppShareLink);
                    } else if (Platform.isIOS) {
                      // iOS-specific code
                      // Share.share(iosShareText + '\n' + iosAppShareLink);
                    }
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(

                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.share, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    LaunchReview.launch(
                      androidAppId: androidAppIdValue,
                      iOSAppId: iOSAppIdValue,);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(

                    child: Material(

                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.feedback, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    LaunchReview.launch(
                        androidAppId: androidAppIdValue,
                        iOSAppId: iOSAppIdValue);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(34.0),
                  child: Container(

                    child: Material(

                      borderRadius: BorderRadius.circular(30),
                      elevation: 8,
                      child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: kprimarycolor,
                          child: Icon(
                            Icons.star_rate, color: kmarroncolor, size: 24,)),
                    ),
                  ),
                ),

              ],
            ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_isBannerAdReady)
            Container(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
        ],
      ),

    );
  }


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
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

  void getSwitchLanguage() async{
    isLanguageSelected = (await getSwitchState())!;
    setState(() {});
  }

  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState", value);
    print('Switch Value saved $value');
    return prefs.setBool("switchState", value);
  }

  Future<bool?> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSwitchedFT = prefs.getBool("switchState");
    print(isSwitchedFT);

    return isSwitchedFT;
  }
}


