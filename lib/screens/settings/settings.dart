import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: GoogleFonts.overpass(
                fontSize: 30.0,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                context.beamToNamed('/settings/profile');
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Profile Settings",
                  style: GoogleFonts.overpass(
                    fontSize: 30.0,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                context.beamToNamed('/settings/account');
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Account Settings",
                  style: GoogleFonts.overpass(
                    fontSize: 30.0,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
