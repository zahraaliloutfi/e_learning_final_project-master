import 'package:e_learning_final_project/controller/providers/localizationprovider.dart';
import 'package:e_learning_final_project/controller/providers/navigation%20provider/navigation_provider.dart';
import 'package:e_learning_final_project/controller/providers/searchprovider.dart';
import 'package:e_learning_final_project/view/global/theme/dark_theme.dart';
import 'package:e_learning_final_project/view/global/theme/light_theme.dart';
import 'package:e_learning_final_project/view/screens/onboarding_pages.dart/first_time_onboarding.dart';
import 'package:e_learning_final_project/view/screens/splash%20screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'controller/providers/ChatGPT/ChatGPT.dart';
import 'controller/providers/ChatGPT/Chat_provider.dart';
import 'controller/providers/courses/all_courses_provider.dart';
import 'controller/providers/courses/coursesprovider.dart';
import 'controller/providers/themeprovider.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//  await FirebaseApi().initNotification();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalizationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoursesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllCoursesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoursesCategoriesProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Provider.of<LocalizationProvider>(context).currentLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: child,
          theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
        );
      },
      child:  SplashScreen(),
    );
  }
}
