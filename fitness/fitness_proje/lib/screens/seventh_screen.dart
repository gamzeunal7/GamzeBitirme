import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fitness_proje/screens/eight_screen.dart';
import 'package:fitness_proje/screens/home_screen.dart';

void main() {
  runApp(const SeventhScreen());
}

class SeventhScreen extends StatelessWidget {
  const SeventhScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grafik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Günlük Alınan Besin Değerleri(kcal)'),
      debugShowCheckedModeBanner: false, // Debug banner'ı gizler
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true); // Tooltip etkinleştirildi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Geri butonu
          onPressed: () {
            Navigator.pop(context); // Bir önceki ekrana dön
          },
        ),
      ),
      body: SfCircularChart(
        title: ChartTitle(
          text: 'Protein, Karbonhidrat, Yağ, Su, Vitamin',
        ),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          RadialBarSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
            maximumValue: 30000, // Maksimum değer
          ),
        ],
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(context), // Bottom Navigation Bar ekle
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Protein', 15000),
      GDPData('Karbonhidrat', 12200),
      GDPData('Yağ', 15000),
      GDPData('Vitamin', 21000),
      GDPData('Su', 10000),
    ];
    return chartData;
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
          ),
          label: 'Anasayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, size: 30),
          label: 'Menü',
        ),
      ],
      currentIndex: 0, // Anasayfa item
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()), // Anasayfaya geçiş
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const EightScreen()), // Menüye geçiş
          );
        }
      },
      selectedItemColor: Colors.white, // Seçili öğenin rengi
      unselectedItemColor: Colors.white, // Seçili olmayan öğelerin rengi
      backgroundColor: Colors.blueGrey[900],
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
