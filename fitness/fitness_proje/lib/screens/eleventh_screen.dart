import 'package:flutter/material.dart';

class EleventhScreen extends StatefulWidget {
  @override
  _EleventhScreenState createState() => _EleventhScreenState();
}

class _EleventhScreenState extends State<EleventhScreen> {
  final List<String> notifications = []; // Ekranda gösterilecek bildirimler
  final List<String> notificationTexts = [
    "Bildirim 1: Su içmeyi unutma!",
    "Bildirim 2: Kısa bir yürüyüşün tam vakti.",
    "Bildirim 3: Bugünkü kalori hedefine ulaştın!",
    "Bildirim 4: Bugün protein açısından zengin öğünlere ne dersin?",
    "Bildirim 5: Saate bak! Uyku vaktin geldi.",
  ]; // Bildirim metinleri
  bool isShowingNotifications = false;

  @override
  void initState() {
    super.initState();
    _showNotifications(); // Bildirimleri doğrudan göster
  }

  void _showNotifications() async {
    for (int i = 0; i < notificationTexts.length; i++) {
      await Future.delayed(Duration(milliseconds: 300)); // Animasyon aralığı
      setState(() {
        notifications.add(notificationTexts[i]); // Bildirim metni ekleniyor
      });
    }
    setState(() {
      isShowingNotifications = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildirimler"),
      ),
      body: Stack(
        children: [
          if (isShowingNotifications)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Tüm bildirimler gösterildi!",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: NotificationCard(notification: notifications[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade500, // Saydam siyah
        borderRadius: BorderRadius.circular(16), // Yuvarlatılmış köşeler
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              notification,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
