import 'package:flutter/material.dart';
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/signin_screen.dart';
import 'data/candi_data.dart';

void main() {
  runApp(const MainApp());
}

/// The main application widget.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure candiList is not empty before accessing its first element
    //final candi = candiList.isNotEmpty ? candiList[0] : null;

    return MaterialApp(
      title: "Wisata Candi",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(primary: Colors.deepPurple, surface: Colors.deepPurple[50]),
      ),
      // home: DetailScreen(
      //   candi: candiList[2],
      // ), // Example usage with the first Candi
      // home: ProfileScreen(),
      home: SigninScreen(),
    );
  }
}
