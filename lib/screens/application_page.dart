import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodel/application_viewmodel.dart';
import 'package:provider/provider.dart';

class ApplicationsPage extends StatelessWidget {
  static const double cpuLimit = 50.0;
  static const double memoryLimit = 1000.0;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ApplicationsViewModel>(context);

    // Группировка по пользователям
    final Map<String, List> grouped = {};
    for (var app in viewModel.applications) {
      grouped.putIfAbsent(app.domainUser, () => []).add(app);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Запущенные приложения")),
      body: viewModel.loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: grouped.entries.map((entry) {
                final user = entry.key;
                final apps = entry.value;
                return ExpansionTile(
                  title: Text(user, style: TextStyle(fontWeight: FontWeight.bold)),
                  children: apps.map<Widget>((app) {
                    final isHighCpu = app.cpuUsage > cpuLimit;
                    final isHighMemory = app.memoryUsage > memoryLimit;
                    return ListTile(
                      leading: _getAppIcon(app.name),
                      title: Text(app.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Машина: ${app.machineId}"),
                          Text("Статус: ${app.status}"),
                          Text(
                            "CPU: ${app.cpuUsage.toStringAsFixed(1)}%",
                            style: TextStyle(color: isHighCpu ? Colors.red : null),
                          ),
                          Text(
                            "Память: ${app.memoryUsage.toStringAsFixed(1)} MB",
                            style: TextStyle(color: isHighMemory ? Colors.red : null),
                          ),
                          Text("Время: ${app.timestamp}"),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      tileColor: (isHighCpu || isHighMemory) ? Colors.red.withOpacity(0.08) : null,
                    );
                  }).toList(),
                );
              }).toList(),
            ),
    );
  }

  Widget _getAppIcon(String name) {
    switch (name.toLowerCase()) {
      case 'chrome':
        return Icon(Icons.language, color: Colors.amber);
      case 'vs code':
        return Icon(Icons.code, color: Colors.blueAccent);
      case '1c:enterprise':
        return Icon(Icons.business, color: Colors.orange);
      case 'thunderbird':
        return Icon(Icons.email, color: Colors.lightBlue);
      case 'telegram':
        return Icon(Icons.send, color: Colors.blue);
      case 'libreoffice writer':
        return Icon(Icons.description, color: Colors.greenAccent);
      default:
        return Icon(Icons.apps, color: Colors.grey);
    }
  }
}