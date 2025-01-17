import 'package:flutter/material.dart';
import 'package:fitness_proje/screens/home_screen.dart'; // HomeScreen import edildi
import 'package:fitness_proje/screens/eight_screen.dart'; // EightScreen import edildi
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const TenthScreen());
}

class TenthScreen extends StatelessWidget {
  const TenthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Günlere Göre Yakılan Kalori',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kalori Grafiği'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<CaloriesData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  int _selectedIndex = 0; // Bottom Navigation seçili index

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true); // Tooltip etkinleştirildi
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation işlemleri
    if (index == 0) {
      // Anasayfa'ya git
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const HomeScreen()), // Anasayfaya Git
      );
    } else if (index == 1) {
      // Menü sayfasına git
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const EightScreen()), // Menüye Git
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            // Geriye gitmek için bir ikon ekledik
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Önceki ekrana git
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SfCartesianChart(
                title: ChartTitle(
                  text: 'Günlere Göre Yakılan Kalori',
                ), // Grafik başlığı
                legend: Legend(
                  isVisible: false,
                ), // Grafik açıklama alanı
                tooltipBehavior: _tooltipBehavior, // Tooltip ayarı
                series: <ChartSeries>[
                  LineSeries<CaloriesData, String>(
                    // LineChart için veri serisi
                    name: 'Yakılan Kalori',
                    dataSource: _chartData,
                    xValueMapper: (CaloriesData data, _) => data.day,
                    yValueMapper: (CaloriesData data, _) => data.calories,
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true), // Veri etiketleri gösteriliyor
                    enableTooltip: true,
                  ),
                ],
                primaryXAxis: CategoryAxis(
                  title: AxisTitle(text: 'Günler'), // X ekseni başlığı
                ),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value} kcal', // Y ekseni değer biçimi
                  title: AxisTitle(
                      text: 'Yakılan Kalori (kcal)'), // Y ekseni başlığı
                  minimum: 0, // Y ekseni minimum değeri
                  maximum: 500, // Y ekseni maksimum değeri
                  interval: 50, // Y ekseni aralığı
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              label: 'Anasayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
              label: 'Menü',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white, // Seçili öğenin rengi
          unselectedItemColor:
              Colors.grey[400], // Seçili olmayan öğelerin rengi
          backgroundColor: Colors.blueGrey[900], // Arka plan rengi
        ),
      ),
    );
  }

  List<CaloriesData> getChartData() {
    // Günlere göre yakılan kaloriler (0-500 kcal aralığında)
    final List<CaloriesData> chartData = [
      CaloriesData('Pazartesi', 300),
      CaloriesData('Salı', 250),
      CaloriesData('Çarşamba', 200),
      CaloriesData('Perşembe', 400),
      CaloriesData('Cuma', 350),
      CaloriesData('Cumartesi', 450),
      CaloriesData('Pazar', 300),
    ];
    return chartData;
  }
}

// Günlere göre yakılan kaloriyi temsil eden veri modeli
class CaloriesData {
  CaloriesData(this.day, this.calories);

  final String day; // Gün ismi
  final double calories; // Yakılan kalori miktarı
}
