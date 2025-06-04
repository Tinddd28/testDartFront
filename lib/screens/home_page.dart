import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/info_card.dart';
import 'package:flutter_application_1/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> lastEvents = [
    {
      "title": "Высокое потребление CPU",
      "subtitle": "Chrome превысил 80% загрузки процессора",
      "time": "12:34"
    },
    {
      "title": "Открыт подозрительный файл",
      "subtitle": "user1 открыл archive.zip",
      "time": "12:30"
    },
    {
      "title": "Большой сетевой трафик",
      "subtitle": "Передано более 1 ГБ через eth0",
      "time": "12:20"
    },
    {
      "title": "Ошибка доступа",
      "subtitle": "user2 не удалось удалить report.pdf",
      "time": "12:10"
    },
    {
      "title": "Изменение файла",
      "subtitle": "admin изменил document.txt",
      "time": "12:00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Главная")),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Общая информация", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InfoCard(
                  title: "Устройства в сети",
                  value: "5",
                  icon: Icons.devices,
                  color: Colors.blueAccent,
                ),
                InfoCard(
                  title: "Активные приложения",
                  value: "12",
                  icon: Icons.apps,
                  color: Colors.green,
                ),
                InfoCard(
                  title: "Передано данных",
                  value: "500 MB",
                  icon: Icons.network_check,
                  color: Colors.orange,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("Последние события", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: lastEvents.length,
                itemBuilder: (context, index) {
                  final event = lastEvents[index];
                  return ListTile(
                    leading: Icon(
                      _getEventIcon(event["title"] ?? ""),
                      color: Colors.blueGrey,
                    ),
                    title: Text(event["title"] ?? ""),
                    subtitle: Text(event["subtitle"] ?? ""),
                    trailing: Text(event["time"] ?? "", style: TextStyle(color: Colors.grey)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getEventIcon(String title) {
    if (title.contains("CPU")) return Icons.memory;
    if (title.contains("файл")) return Icons.insert_drive_file;
    if (title.contains("сетевой")) return Icons.network_check;
    if (title.contains("Ошибка")) return Icons.error;
    if (title.contains("Изменение")) return Icons.edit;
    return Icons.info;
  }
}