import 'package:fitness_proje/screens/login_screen.dart';
import 'package:fitness_proje/screens/third_screen.dart'; // ThirdScreen ekranını import et
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('SAU Fitness',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.deepOrangeAccent)),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Uygulamaya Hoşgeldiniz'),
              Image.asset('assets/images/ana.png', width: 400),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ThirdScreen(), // Egzersizlere direkt git
                        ),
                      );
                    },
                    child: Icon(Icons.fitness_center,
                        size: 50, color: Colors.indigoAccent),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
