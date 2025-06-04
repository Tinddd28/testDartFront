import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodel/file_activity_viewmodel.dart';
import 'package:provider/provider.dart';

class FileActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FileActivityViewModel>(context);

    // Группировка по пользователям (domainUser)
    final Map<String, List> grouped = {};
    for (var activity in viewModel.fileActivities) {
      grouped.putIfAbsent(activity.domainUser, () => []).add(activity);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Файловая активность")),
      body: viewModel.loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: grouped.entries.map((entry) {
                final user = entry.key;
                final activities = entry.value;
                return ExpansionTile(
                  title: Text(user, style: TextStyle(fontWeight: FontWeight.bold)),
                  children: activities.map<Widget>((activity) {
                    final actionColor = _getActionColor(activity.action);
                    return ListTile(
                      leading: _getFileIcon(activity.file),
                      title: Text(activity.file, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Действие: ${activity.action}", style: TextStyle(color: actionColor)),
                          Text("Дата: ${activity.date}"),
                          Text("Размер: ${activity.fileSize.toStringAsFixed(1)} KB"),
                          Text("Пользователь: ${activity.user}"),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
    );
  }

  Color _getActionColor(String action) {
    switch (action) {
      case "Создан":
        return Colors.green;
      case "Изменён":
        return Colors.orange;
      case "Удалён":
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  Widget _getFileIcon(String fileName) {
    if (fileName.endsWith(".txt")) {
      return Icon(Icons.description, color: Colors.blue);
    } else if (fileName.endsWith(".png") || fileName.endsWith(".jpg")) {
      return Icon(Icons.image, color: Colors.pink);
    } else if (fileName.endsWith(".zip")) {
      return Icon(Icons.archive, color: Colors.brown);
    } else {
      return Icon(Icons.insert_drive_file, color: Colors.grey);
    }
  }
}