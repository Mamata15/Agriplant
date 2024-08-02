import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/onboarding_page.dart';
import 'pages/contact_us_page.dart'; // Import for ContactUsPage

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: const OnboardingPage(),
      routes: {
        '/contact_us': (context) => const ContactUs(),
      },
    );
  }
}
