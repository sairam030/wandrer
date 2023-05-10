import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
import 'package:wandrer/src/screens/menu_page/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/backdrop.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              'WanDrer',
              style: GoogleFonts.russoOne(
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Positioned(
              bottom: 15,
              left: 90,
              child: SliderButton(
                action: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  );
                },
                label: Text(
                  "Slide to Explore",
                  style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                icon: Text(
                  ">>",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
