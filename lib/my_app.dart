// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran/feature/quran/data/ayat_sour_data.dart';
import 'package:quran/feature/quran/view/screen/surah_screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'القرآن الكريم',
      locale: const Locale('ar', 'SA'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 46, 17, 44),
          secondary: Color.fromARGB(255, 133, 61, 122),
          tertiary: Color.fromARGB(255, 207, 62, 207),
          surface: Colors.white,
          onSurface: Color.fromARGB(255, 26, 26, 26),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 72, 39, 68),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 227, 188, 221),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 72, 39, 71),
            size: 24,
          ),
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 67, 30, 77),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 77, 30, 68),
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 77, 30, 68),
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 26, 26, 26),
          ),
          bodyMedium: TextStyle(
            fontSize: 26,
            color: Color.fromARGB(255, 26, 26, 26),
            height: 1.8,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Color.fromARGB(255, 46, 17, 38).withOpacity(0.08),
        ),
        dividerTheme: DividerThemeData(
          color: const Color.fromARGB(255, 46, 17, 38).withOpacity(0.1),
          thickness: 1,
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 46, 17, 38),
          size: 24,
        ),
      ),
      home: SurahListScreen(quranList: quranList),
    );
  }
}
