import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirestore/res/AppContextExtension.dart';
import 'package:flutterfirestore/view/homeAnalytics/HomeScreenAnalytics.dart';

import 'models/dataList/MoviesMain.dart';
import 'view/details/MovieDetailsScreen.dart';
import 'view/home/HomeScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'SecondaryApp',
      options: const FirebaseOptions(
          appId: '1:174299428868:android:c39d1d12b3e9616f1ddd51',
          apiKey: 'my_apiKey',
          messagingSenderId: '174299428868',
          projectId: 'flutterfire-5e7db')
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
        accentColor: context.resources.color.colorAccent,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: MyHomePage(
        title: "Home Analytics",
        analytics: analytics,
        observer: observer,
      ),
    );
  }
}
