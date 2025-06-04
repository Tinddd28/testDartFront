class Application {
  final String name;
  final String status;
  final double cpuUsage;
  final double memoryUsage;
  final String domainUser; // Доменное имя пользователя
  final String machineId; // Номер машины
  final String timestamp; // Время
  final int processId; // ID процесса
  final String version; // Версия приложения
  final String path; // Путь к исполняемому файлу
  final int threads; // Количество потоков
  final double networkUsage; // Сетевой трафик (МБ/с)
  final bool isResponding; // Отвечает ли приложение

  Application({
    required this.name,
    required this.status,
    required this.cpuUsage,
    required this.memoryUsage,
    required this.domainUser,
    required this.machineId,
    required this.timestamp,
    required this.processId,
    required this.version,
    required this.path,
    required this.threads,
    required this.networkUsage,
    required this.isResponding,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      name: json['name'],
      status: json['status'],
      cpuUsage: json['cpu_usage']?.toDouble() ?? 0.0,
      memoryUsage: json['memory_usage']?.toDouble() ?? 0.0,
      domainUser: json['domain_user'] ?? "Неизвестный пользователь",
      machineId: json['machine_id'] ?? "000",
      timestamp: json['timestamp'] ?? "2023-01-01T00:00:00Z",
      processId: json['process_id'] ?? 0,
      version: json['version'] ?? "1.0.0",
      path: json['path'] ?? "/unknown/path",
      threads: json['threads'] ?? 1,
      networkUsage: json['network_usage']?.toDouble() ?? 0.0,
      isResponding: json['is_responding'] ?? true,
    );
  }
}