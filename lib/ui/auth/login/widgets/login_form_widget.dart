import 'package:curso_mvvm_youtube/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  final LoginViewmodel loginViewmodel;
  const LoginFormWidget({super.key, required this.loginViewmodel});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;

  @override
  void initState() {
    super.initState();
    widget.loginViewmodel.login.addListener(_onResult);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          Column(
            children: [
              Row(children: [Text("Usuário")]),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, digite o usuário";
                  }
                  return null;
                },
                controller: usernameController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
          Column(
            children: [
              Row(children: [Text("Senha")]),
              TextFormField(
                obscureText: isPasswordObscure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, digite a senha";
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: Icon(
                      isPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListenableBuilder(
            listenable: widget.loginViewmodel.login,
            builder: (context, child) {
              final running = widget.loginViewmodel.login.running;

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: _validateForm,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: running
                      ? CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
                        )
                      : Text("Login", style: TextStyle(color: Colors.white)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      final username = usernameController.text;
      final password = passwordController.text;
      await widget.loginViewmodel.login.execute((username, password));
    }
  }

  void _onResult() {
    final command = widget.loginViewmodel.login;
    if (command.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Usuários ou senhas incorretos"),
        ),
      );
    }
    if (command.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Logado com sucesso!"),
        ),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      isPasswordObscure = !isPasswordObscure;
    });
  }

  @override
  void dispose() {
    widget.loginViewmodel.login.removeListener(_onResult);
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
