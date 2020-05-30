import 'package:flutter/material.dart';
import 'package:fluttercalculator/calculator/calculator.dart';
import 'package:fluttercalculator/screens/calculator_screen.dart';
import 'package:fluttercalculator/widgets/neumorphic_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: kDarkBackgroundColour,
      ),
      theme: ThemeData(
        canvasColor: kBackgroundColour,
        backgroundColor: Color.fromRGBO(231, 240, 247, 1),
        scaffoldBackgroundColor: Color.fromRGBO(231, 240, 247, 1),
        textTheme: TextTheme(
          headline1: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(49, 68, 105, 1),
            ),
          ),
          headline4: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(49, 68, 105, 1),
            ),
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final brightnessValue = MediaQuery.of(context).platformBrightness;
          bool isDark = brightnessValue == Brightness.dark;
          final theme = isDark ? darkNeumorphicTheme : lightNeumorphicTheme;

          return MultiProvider(
            providers: [
              ProxyProvider0<NeumorphicTheme>(update: (_, __) => theme),
              ChangeNotifierProvider<Calculator>(
                create: (_) => Calculator(),
              )
            ],
            child: CalculatorScreen(),
          );
        },
      ),
    );
  }
}

