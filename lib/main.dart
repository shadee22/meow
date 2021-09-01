import 'package:flutter/material.dart';
import 'package:meowing/services/auth.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:meowing/models/user.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meowing/ads/helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());


  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
