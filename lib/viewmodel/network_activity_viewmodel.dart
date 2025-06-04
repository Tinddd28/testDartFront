import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:flutter_application_1/models/network_activity.dart';

class NetworkActivityViewModel with ChangeNotifier {
  List<NetworkActivity> _networkActivities = [];
  bool _loading = true;

  List<NetworkActivity> get networkActivities => _networkActivities;
  bool get loading => _loading;

  NetworkActivityViewModel() {
    fetchNetworkActivities();
  }

  Future<void> fetchNetworkActivities() async {
    await Future.delayed(Duration(seconds: 2)); // Имитация задержки
    try {
      final data = [
        {
          "ip": "192.168.1.10",
          "port": "443",
          "protocol": "TCP",
          "domain": "google.com",
          "sent": 300.0,
          "received": 1200.0,
          "adapter": "eth0",
          "method": "GET",
          "status_code": 200,
          "domain_user": "DOMAIN\\admin",
          "machine_id": "001",
          "timestamp": "2024-10-01 12:34:56"
        },
        {
          "ip": "192.168.1.10",
          "port": "80",
          "protocol": "TCP",
          "domain": "flutter.dev",
          "sent": 100.0,
          "received": 500.0,
          "adapter": "eth0",
          "method": "GET",
          "status_code": 200,
          "domain_user": "DOMAIN\\admin",
          "machine_id": "001",
          "timestamp": "2024-10-01 12:40:00"
        },
        {
          "ip": "192.168.1.11",
          "port": "443",
          "protocol": "UDP",
          "domain": "test.com",
          "sent": 50.0,
          "received": 200.0,
          "adapter": "wlan0",
          "method": "POST",
          "status_code": 404,
          "domain_user": "DOMAIN\\volkov",
          "machine_id": "002",
          "timestamp": "2024-10-02 15:20:10"
        },
        {
          "ip": "192.168.1.11",
          "port": "22",
          "protocol": "TCP",
          "domain": "internal.local",
          "sent": 20.0,
          "received": 80.0,
          "adapter": "wlan0",
          "method": "SSH",
          "status_code": 200,
          "domain_user": "DOMAIN\\volkov",
          "machine_id": "002",
          "timestamp": "2024-10-02 16:00:00"
        },
        {
          "ip": "192.168.1.12",
          "port": "8080",
          "protocol": "TCP",
          "domain": "api.example.com",
          "sent": 400.0,
          "received": 900.0,
          "adapter": "eth1",
          "method": "GET",
          "status_code": 200,
          "domain_user": "DOMAIN\\petrov",
          "machine_id": "003",
          "timestamp": "2024-10-03 09:10:00"
        },
        {
          "ip": "192.168.1.12",
          "port": "53",
          "protocol": "UDP",
          "domain": "dns.google",
          "sent": 10.0,
          "received": 30.0,
          "adapter": "eth1",
          "method": "DNS",
          "status_code": 200,
          "domain_user": "DOMAIN\\petrov",
          "machine_id": "003",
          "timestamp": "2024-10-03 09:15:00"
        },
        {
          "ip": "192.168.1.10",
          "port": "443",
          "protocol": "TCP",
          "domain": "github.com",
          "sent": 150.0,
          "received": 600.0,
          "adapter": "eth0",
          "method": "GET",
          "status_code": 200,
          "domain_user": "DOMAIN\\admin",
          "machine_id": "001",
          "timestamp": "2024-10-01 13:00:00"
        },
      ];

      final activities = data.map((json) => NetworkActivity.fromJson(json)).toList();
      _networkActivities = activities;
      _loading = false;
      notifyListeners();
    } catch (e) {
      print("Error fetching network activities: $e");
      _loading = false;
      notifyListeners();
    }
  }
}