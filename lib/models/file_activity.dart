class FileActivity {
  final String file;
  final String action;
  final String date;
  final double fileSize;
  final String user;
  final String domainUser; // Доменное имя пользователя
  final String machineId; // Номер машины
  final String timestamp; // Время
  final String fileType; // Тип файла
  final String filePath; // Путь к файлу
  final String application; // Приложение
  final bool success; // Успешность операции
  final String clientIp; // IP-адрес клиента

  FileActivity({
    required this.file,
    required this.action,
    required this.date,
    required this.fileSize,
    required this.user,
    required this.domainUser,
    required this.machineId,
    required this.timestamp,
    required this.fileType,
    required this.filePath,
    required this.application,
    required this.success,
    required this.clientIp,
  });

  factory FileActivity.fromJson(Map<String, dynamic> json) {
    return FileActivity(
      file: json['file'],
      action: json['action'],
      date: json['date'],
      fileSize: json['file_size']?.toDouble() ?? 0.0,
      user: json['user'] ?? "Неизвестный пользователь",
      domainUser: json['domain_user'] ?? "Неизвестный пользователь",
      machineId: json['machine_id'] ?? "000",
      timestamp: json['timestamp'] ?? "2023-01-01T00:00:00Z",
      fileType: json['file_type'] ?? "unknown",
      filePath: json['file_path'] ?? "/unknown/path",
      application: json['application'] ?? "unknown",
      success: json['success'] ?? true,
      clientIp: json['client_ip'] ?? "0.0.0.0",
    );
  }
}