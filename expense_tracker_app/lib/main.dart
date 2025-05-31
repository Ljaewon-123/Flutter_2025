import 'package:expense_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

const mainSeedColor = Color.fromARGB(255, 96, 59, 181);

// K => global variable 
var kColorScheme = ColorScheme.fromSeed(
  seedColor: mainSeedColor,
);  // fromSeed 가장 좋다. 

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: mainSeedColor,
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardThemeData().copyWith(
          color: kDarkColorScheme.primaryContainer, // 카드의 배경색 
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // 카드의 여백
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer, // 버튼의 배경색
            foregroundColor: kDarkColorScheme.onPrimaryContainer, // 버튼의 글자색
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kDarkColorScheme.onSecondaryContainer, // 제목 글자색
            fontSize: 16,
          ),
        ),
      ),
      theme: ThemeData().copyWith( // 복사가 더 좋다?
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer, // appbar의 글자색 
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.primaryContainer, // 카드의 배경색 
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // 카드의 여백
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer, // 버튼의 배경색
            foregroundColor: kColorScheme.onPrimaryContainer, // 버튼의 글자색
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer, // 제목 글자색
            fontSize: 16,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
