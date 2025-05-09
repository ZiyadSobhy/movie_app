import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/route_manger.dart';

class LoginAsAdmin extends StatefulWidget {
  const LoginAsAdmin({super.key});

  @override
  State<LoginAsAdmin> createState() => _LoginAsAdminState();
}

class _LoginAsAdminState extends State<LoginAsAdmin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login As Admin'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginAsAdmin();
              },
              child: const Text(
                'Login',
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginAsAdmin() {
    // Implement your login logic here
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'admin' && password == '1234') {
       Navigator.pushNamed(context, RouterManger.adminDashboard);
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }
}
