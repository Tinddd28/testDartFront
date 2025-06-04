import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodel/network_activity_viewmodel.dart';
import 'package:flutter_application_1/models/network_activity.dart';
import 'package:provider/provider.dart';

class NetworkActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NetworkActivityViewModel>(context);

    // Группировка: пользователь -> адаптер -> домен -> List<NetworkActivity>
    final Map<String, Map<String, Map<String, List<NetworkActivity>>>> grouped = {};
    for (final activity in viewModel.networkActivities) {
      grouped
        .putIfAbsent(activity.domainUser, () => {})
        .putIfAbsent(activity.adapter, () => {})
        .putIfAbsent(activity.domain, () => [])
        .add(activity);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Сетевая активность")),
      body: viewModel.loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: grouped.entries.map((userEntry) {
                final user = userEntry.key;
                final adapters = userEntry.value;
                return ExpansionTile(
                  title: Text(user, style: TextStyle(fontWeight: FontWeight.bold)),
                  children: adapters.entries.map((adapterEntry) {
                    final adapter = adapterEntry.key;
                    final domains = adapterEntry.value;
                    return ExpansionTile(
                      title: Text("Адаптер: $adapter", style: TextStyle(fontWeight: FontWeight.w500)),
                      children: domains.entries.map((domainEntry) {
                        final domain = domainEntry.key;
                        final acts = domainEntry.value;
                        final sent = acts.fold(0.0, (sum, a) => sum + a.sent);
                        final received = acts.fold(0.0, (sum, a) => sum + a.received);
                        final protocol = acts.isNotEmpty ? acts.first.protocol : '';
                        return ListTile(
                          leading: Icon(Icons.language, color: Colors.blue),
                          title: Text(domain, style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Протокол: $protocol"),
                              Text("Отправлено: ${sent.toStringAsFixed(1)} МБ"),
                              Text("Получено: ${received.toStringAsFixed(1)} МБ"),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
    );
  }
}