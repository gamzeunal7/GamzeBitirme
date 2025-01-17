import 'package:fitness_proje/models/elemanlar_model.dart';
import 'package:fitness_proje/screens/home_screen.dart';
import 'package:fitness_proje/screens/tenth_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<ElemanlarModel> elemanlar = [
    ElemanlarModel('Dumbell Egzersizi',
        'Kilonuza uygun ağırlıklarla günde 10 set 2 tekrar çalışabilirsiniz.Gerekli ekipmanlar: Dumbell'),
    ElemanlarModel('İp Atlama Egzersizi',
        '30 saniye boyunca ip atlayın ve sonra 30 saniye dinlenin.Günde 8 set yapılabilir.Gerekli ekipmanlar: İp'),
    ElemanlarModel('Pilates Topuyla Egzersiz',
        'Pilates matına sırt üstü uzandıktan sonra pilates topunu bacaklarınızla karnınıza çekin. 4 set 10 tekrar Gerekli ekipmanlar: Pilates matı, pilates topu'),
    ElemanlarModel('Şınav Çekme',
        'Yere paralel uzanın ve parmak uçlarınız tam karşıya bakacak şekilde ellerinizi omuz genişliğinden biraz daha geniş açarak, avuç içlerinizi yere koyun. · Ayak parmaklarınızı yere koyun ve kollarınızdan kuvvet alarak göğsünüzü yerden kaldırın.3 Set 5 Tekrar.'),
    ElemanlarModel('Yürüyüş',
        'Her gün 30 dakika orta tempolu bir yürüyüş sizi canlandırabilir. Gerekli ekipmanlar: Yürüme Bandı')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Egzersizler'),
      ),
      body: ListView.separated(
        itemCount: elemanlar.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(elemanlar[index].title),
          subtitle: Text(elemanlar[index].subtitle),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.fitness_center),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TenthScreen()),
                  );
                },
                child: Text(''),
              ),
            ],
          ),
          tileColor: Colors.blueGrey.shade100,
        ),
        separatorBuilder: (context, index) => const Divider(height: 0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.blueGrey.shade900, // Alt çubuğun arka plan rengi
        selectedItemColor: Colors.deepOrangeAccent, // Seçili öğenin rengi
        unselectedItemColor: Colors.white, // Seçili olmayan öğelerin rengi
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center, size: 30),
            label: 'Egzersizler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right_rounded, size: 30),
            label: 'Kalori Grafiği',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TenthScreen()),
            );
          }
        },
      ),
    );
  }
}
