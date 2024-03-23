import 'package:flutter/material.dart';
import 'package:interview_application/src/providers/auth_provider.dart';
import 'package:interview_application/src/src.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const snackBar = SnackBar(
    content: Text('Username/Password is incorrect'),
    backgroundColor: Colors.red,
  );

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildLoginForm(context),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IAInputField(
              controller: _usernameController,
              label: 'Username',
              validator: (value) => validatorUsername(value: value),
              disableTouch: authProvider.loading,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: IAInputField(
                controller: _passwordController,
                label: 'Password',
                obscureText: true,
                prefixIcon: Icons.lock,
                disableTouch: authProvider.loading,
              ),
            ),
            authProvider.status == LoginStatus.authenticating
                ? const IALoading()
                : ElevatedButton(
                    child: const Text("Login"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        await authProvider
                            .login(
                          _usernameController.text,
                          _passwordController.text,
                        )
                            .whenComplete(() {
                          if (authProvider.status == LoginStatus.failure) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.home);
                          }
                        });
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
