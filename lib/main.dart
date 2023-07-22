import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Center(),
    );
  }
}
/*
// ignore_for_file: prefer_const_constructors
import 'package:bloc/bloc.dart';
import 'package:coach/modules/changeLanuage.dart';
import 'package:coach/shared/bloc_observer.dart';
import 'package:coach/shared/network/constants.dart';
import 'package:coach/shared/network/local/cache_helper.dart';
import 'package:coach/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'modules/gym.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  // bool? onBoarding = CacheHelper.getDataIntoShPre(key: 'Onboarding');
 // uId = CacheHelper.getDataIntoShPre(key: 'uId');
  var lang = CacheHelper.getDataIntoShPre(key: 'Lang');

  if (lang != null) {
    lang = lang;
  } else {
    lang = 'en';
  }
  late Widget widget;
  if (uId != null) {
    widget = NewLayout();
  } else {
    widget =  ChangeLanguageScreen();

  }

  //FirebaseAuth.instance.authStateChanges().listen((user) {
  //if (user == null) {
  //    initialRoute = loginScreen;
  //   } else {
  //   initialRoute = newLayout;
  //  }
  //});

  runApp(MyApp(
    //appRouter: AppRouter()
    startWidget: widget,
    lang: lang,
  ));
}
*/
