import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroes_club/OnBoarding/View/OnBoarding.dart';
import 'package:heroes_club/core/class/crud_with_dio.dart';
import 'package:heroes_club/core/services/services.dart';
import 'package:heroes_club/core/shared/my_cash_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() async{


  WidgetsFlutterBinding.ensureInitialized();



  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CashHelper.init();

  await DioHelper.init();
  await initializedServices();

  runApp(
      const ProviderScope(
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),

        debugShowCheckedModeBanner: false,

        home: OnboardingScreen(),

        // Container(

      //   color: Colors.orange,
      //
      // )
    );
  }
}


