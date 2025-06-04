import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String _baseUrl = "https://api.example.com"; 
  static const String _loginEndpoint = "/auth/login";

  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$_loginEndpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'] as String?;
    } else {
      throw Exception("Ошибка входа");
    }
  }

  static void saveToken(String token) {
    // Сохраняем токен в SharedPreferences или другом хранилище
    // Например, используя package:shared_preferences
  }

  static String? getToken() {
    // Получаем токен из SharedPreferences
    return null; // Заменить на реальный код
  }
}