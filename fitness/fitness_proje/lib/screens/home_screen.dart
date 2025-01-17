import 'package:fitness_proje/screens/login_screen.dart';
import 'package:fitness_proje/screens/third_screen.dart'; // ThirdScreen ekranını import et
import 'package:fitness_proje/screens/bildirim_screen.dart';
import 'package:flutter/cupertino.dart';
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
          title: Text(
            'SAU Fitness',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.deepOrangeAccent,
            ),
          ),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Uygulamaya Hoşgeldiniz',
                style: TextStyle(
                  fontSize: 20,
                  color: CupertinoColors.lightBackgroundGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset('assets/images/ana.png', width: 400),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Bildirimler Butonu (Solda)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BildirimScreen(), // Bildirim ekranına geçiş
                        ),
                      );
                    },
                    child: Icon(
                      Icons.notifications, // Bildirimler ikonu
                      size: 40,
                      color: Colors.redAccent,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ThirdScreen(), // Egzersiz ekranına geçiş
                        ),
                      );
                    },
                    child: Icon(
                      Icons.fitness_center, // Fitness ikonu
                      size: 50,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen(), // Login ekranına geçiş
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_circle_right_rounded, // İleri ikonu
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
