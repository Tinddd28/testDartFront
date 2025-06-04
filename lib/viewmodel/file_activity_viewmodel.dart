import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/models/file_activity.dart';

class FileActivityViewModel with ChangeNotifier {
  List<FileActivity> _fileActivities = [];
  bool _loading = true;

  List<FileActivity> get fileActivities => _fileActivities;
  bool get loading => _loading;

  FileActivityViewModel() {
    fetchFileActivities();
  }

  Future<void> fetchFileActivities() async {
    await Future.delayed(Duration(seconds: 2)); // Имитация задержки
    try {
      final data = [
        {
          "file": "document.txt",
          "action": "Создан",
          "date": "2024-10-01",
          "file_size": 1024.0,
          "user": "admin",
          "domain_user": "DOMAIN\\admin",
          "machine_id": "001",
          "timestamp": "2024-10-01 12:34:56",
          "file_type": "txt",
          "file_path": "/home/admin/documents/document.txt",
          "application": "gedit",
          "success": true,
          "client_ip": "192.168.1.10"
        },
        {
          "file": "image.png",
          "action": "Изменён",
          "date": "2024-10-02",
          "file_size": 512.0,
          "user": "volkov",
          "domain_user": "DOMAIN\\volkov",
          "machine_id": "002",
          "timestamp": "2024-10-02 15:20:10",
          "file_type": "png",
          "file_path": "/home/volkov/pictures/image.png",
          "application": "gimp",
          "success": true,
          "client_ip": "192.168.1.11"
        },
        {
          "file": "report.pdf",
          "action": "Открыт",
          "date": "2024-10-03",
          "file_size": 2048.0,
          "user": "petrov",
          "domain_user": "DOMAIN\\petrov",
          "machine_id": "003",
          "timestamp": "2024-10-03 09:10:00",
          "file_type": "pdf",
          "file_path": "/home/petrov/reports/report.pdf",
          "application": "evince",
          "success": true,
          "client_ip": "192.168.1.12"
        },
        {
          "file": "presentation.pptx",
          "action": "Удалён",
          "date": "2024-10-04",
          "file_size": 3072.0,
          "user": "admin",
          "domain_user": "DOMAIN\\admin",
          "machine_id": "001",
          "timestamp": "2024-10-04 14:22:00",
          "file_type": "pptx",
          "file_path": "/home/admin/presentations/presentation.pptx",
          "application": "libreoffice",
          "success": false,
          "client_ip": "192.168.1.10"
        },
        {
          "file": "music.mp3",
          "action": "Скопирован",
          "date": "2024-10-05",
          "file_size": 4096.0,
          "user": "volkov",
          "domain_user": "DOMAIN\\volkov",
          "machine_id": "002",
          "timestamp": "2024-10-05 17:45:00",
          "file_type": "mp3",
          "file_path": "/home/volkov/music/music.mp3",
          "application": "nautilus",
          "success": true,
          "client_ip": "192.168.1.11"
        },
        {
          "file": "archive.zip",
          "action": "Распакован",
          "date": "2024-10-06",
          "file_size": 8192.0,
          "user": "petrov",
          "domain_user": "DOMAIN\\petrov",
          "machine_id": "003",
          "timestamp": "2024-10-06 10:30:00",
          "file_type": "zip",
          "file_path": "/home/petrov/downloads/archive.zip",
          "application": "file-roller",
          "success": true,
          "client_ip": "192.168.1.12"
        },
      ];

      final activities = data.map((json) => FileActivity.fromJson(json)).toList();
      _fileActivities = activities;
      _loading = false;
      notifyListeners();
    } catch (e) {
      print("Error fetching file activities: $e");
      _loading = false;
      notifyListeners();
    }
  }
}