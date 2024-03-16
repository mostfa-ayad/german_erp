import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_erp/auth/presentation/pages/cubit/auth_cubit.dart';
import 'package:german_erp/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var font = GoogleFonts.notoKufiArabicTextTheme.call();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
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
        home: const Homepage(),
      ),
    );
  }
}
