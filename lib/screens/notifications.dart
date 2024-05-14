import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          'Notifiacations',
          style: GoogleFonts.overpass(
            fontSize: 30.0,
            color: Colors.green,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
