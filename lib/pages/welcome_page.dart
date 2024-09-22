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
              image: AssetImage('assets/images/image.png'), fit: BoxFit.cover),
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          // color: Colors.white.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(42),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 23,
                        color: Colors.greenAccent,
                        spreadRadius: 10),
                  ],
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
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.greenAccent)),
                  onPressed: () {},
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
