import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool _obscure = true;
  bool _loading = false;
  String? _error;

  void _login() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    await Future.delayed(Duration(seconds: 1)); // Имитация запроса
    if (_username == "admin" && _password == "admin") {
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      setState(() {
        _error = "Неверный логин или пароль";
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Вход")),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 350,
            minWidth: 250,
            maxHeight: 400,
          ),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Авторизация", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 24),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Логин"),
                      onChanged: (v) => _username = v,
                      validator: (v) => v == null || v.isEmpty ? "Введите логин" : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Пароль",
                        suffixIcon: IconButton(
                          icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                      ),
                      obscureText: _obscure,
                      onChanged: (v) => _password = v,
                      validator: (v) => v == null || v.isEmpty ? "Введите пароль" : null,
                    ),
                    if (_error != null) ...[
                      SizedBox(height: 12),
                      Text(_error!, style: TextStyle(color: Colors.red)),
                    ],
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _loading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  _login();
                                }
                              },
                        child: _loading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text("Войти"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}