class NetworkActivity {
  final String ip;
  final String port;
  final String protocol;
  final String domain;
  final double sent; // Отправлено данных (МБ)
  final double received; // Получено данных (МБ)
  final String adapter; // Имя сетевого адаптера
  final String method;
  final int statusCode;
  final String domainUser; // Доменное имя пользователя
  final String machineId; // Номер машины
  final String timestamp; // Время

  NetworkActivity({
    required this.ip,
    required this.port,
    required this.protocol,
    required this.domain,
    required this.sent,
    required this.received,
    required this.adapter,
    required this.method,
    required this.statusCode,
    required this.domainUser,
    required this.machineId,
    required this.timestamp,
  });

  factory NetworkActivity.fromJson(Map<String, dynamic> json) {
    return NetworkActivity(
      ip: json['ip'],
      port: json['port'],
      protocol: json['protocol'],
      domain: json['domain'] ?? "Неизвестный домен",
      sent: json['sent']?.toDouble() ?? 0.0,
      received: json['received']?.toDouble() ?? 0.0,
      adapter: json['adapter'] ?? "eth0",
      method: json['method'] ?? "GET",
      statusCode: json['status_code'] ?? 200,
      domainUser: json['domain_user'] ?? "Неизвестный пользователь",
      machineId: json['machine_id'] ?? "000",
      timestamp: json['timestamp'] ?? "2023-01-01T00:00:00Z",
    );
  }
}