import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:german_erp/main_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Supabase.initialize(
    url: 'https://yoabtoerydsjydkaajzr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlvYWJ0b2VyeWRzanlka2FhanpyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAwNjIwNDEsImV4cCI6MjAyNTYzODA0MX0.ANyMlYB44Ivihd29n76hBWZ10bt1I4yhAFOMjFifcrM',
  );
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar'),
        saveLocale: true,
        startLocale: const Locale('ar'),
        child: const MyApp()),
  );
}

var supabase = Supabase.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var font = GoogleFonts.notoKufiArabicTextTheme.call();
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(400, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: font.copyWith().apply(),
          ),
          home: child,
        );
      },
      child: const MainApp(),
    );
  }
}
