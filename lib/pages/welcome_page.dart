import 'package:easyeat/pages/home_page.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          // color: Colors.white.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(95),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 7.0,
                        sigmaY: 7.0,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.92,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.1)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      // color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(42),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //       blurRadius: 23,
                      //       color: Colors.greenAccent,
                      //       spreadRadius: 10),
                      // ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " EasyEat ",
                        style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * 0.2,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 13, 2, 79),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.greenAccent)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '     Next >   ',
                      style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 13, 2, 79),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
