import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color kBlack = Colors.black;
  static Color kGrey = Colors.grey;
  static Color kWhite = Colors.white;
  static Color kTransparant = Colors.transparent;
  static Color kWarning = Colors.yellow;
  static Color kSuccess = Colors.green;
  static Color kError = Colors.red;
  static Color kblue = Colors.blue;

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];
  static TextStyle title = GoogleFonts.montserrat(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle desc = GoogleFonts.montserrat(
      fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.grey);
  static TextStyle customTitle = GoogleFonts.montserrat(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle customDesc = GoogleFonts.montserrat(
      fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black);
  static TextStyle appTitle =
      GoogleFonts.montserrat(fontSize: 22.0, color: Colors.white);

  static SizedBox kHeight25 = const SizedBox(
    height: 25,
  );
  static SizedBox kHeight15 = const SizedBox(
    height: 15,
  );
  static BorderRadius kRadius10 = BorderRadius.circular(10);
}
