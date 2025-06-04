import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/models/application.dart';

class ApplicationsViewModel with ChangeNotifier {
  List<Application> _applications = [];
  bool _loading = true;

  List<Application> get applications => _applications;
  bool get loading => _loading;

  ApplicationsViewModel() {
    fetchApplications();
  }

  Future<void> fetchApplications() async {
    await Future.delayed(Duration(seconds: 2)); // Имитация задержки
    try {
      final data = [
        {
          "name": "Chrome",
          "status": "Активно",
          "cpu_usage": 45.0,
          "memory_usage": 800.0,
          "domain_user": "DOMAIN\\admin",
          "machine_id": "001",
          "timestamp": "2024-10-01 12:34:56",
          "process_id": 1234,
          "version": "117.0.5938.92",
          "path": "/usr/bin/google-chrome",
          "threads": 35,
          "network_usage": 2.5,
          "is_responding": true,
        },
        {
          "name": "VS Code",
          "status": "Неактивно",
          "cpu_usage": 15.0,
          "memory_usage": 300.0,
          "domain_user": "DOMAIN\\volkov",
          "machine_id": "002",
          "timestamp": "2024-10-02 15:20:10",
          "process_id": 2345,
          "version": "1.82.2",
          "path": "/usr/share/code/code",
          "threads": 20,
          "network_usage": 0.8,
          "is_responding": true,
        },
        {
          "name": "1C:Enterprise",
          "status": "Активно",
          "cpu_usage": 60.0,
          "memory_usage": 1200.0,
          "domain_user": "DOMAIN\\petrov",
          "machine_id": "001",
          "timestamp": "2024-10-01 13:00:00",
          "process_id": 3456,
          "version": "8.3.20.1705",
          "path": "/opt/1cv8/8.3.20.1705/1cv8",
          "threads": 50,
          "network_usage": 5.2,
          "is_responding": false,
        },
        {
          "name": "Thunderbird",
          "status": "Активно",
          "cpu_usage": 10.0,
          "memory_usage": 250.0,
          "domain_user": "DOMAIN\\admin",
          "machine_id": "001",
          "timestamp": "2024-10-01 12:40:00",
          "process_id": 4567,
          "version": "115.3.1",
          "path": "/usr/bin/thunderbird",
          "threads": 15,
          "network_usage": 0.3,
          "is_responding": true,
        },
        {
          "name": "Telegram",
          "status": "Неактивно",
          "cpu_usage": 2.0,
          "memory_usage": 120.0,
          "domain_user": "DOMAIN\\volkov",
          "machine_id": "002",
          "timestamp": "2024-10-02 15:25:00",
          "process_id": 5678,
          "version": "4.8.1",
          "path": "/opt/telegram/Telegram",
          "threads": 10,
          "network_usage": 0.1,
          "is_responding": true,
        },
        {
          "name": "LibreOffice Writer",
          "status": "Активно",
          "cpu_usage": 8.0,
          "memory_usage": 180.0,
          "domain_user": "DOMAIN\\ivanov",
          "machine_id": "003",
          "timestamp": "2024-10-03 09:10:00",
          "process_id": 6789,
          "version": "7.5.4.2",
          "path": "/usr/bin/libreoffice",
          "threads": 12,
          "network_usage": 0.2,
          "is_responding": true,
        },
      ];

      final apps = data.map((json) => Application.fromJson(json)).toList();
      _applications = apps;
      _loading = false;
      notifyListeners();
    } catch (e) {
      print("Error fetching applications: $e");
      _loading = false;
      notifyListeners();
    }
  }
}