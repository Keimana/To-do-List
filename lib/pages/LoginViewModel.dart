import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class LoginScreen extends StatefulWidget {
  final MainViewModel viewModel; // Change the type to MainViewModel

  LoginScreen({required this.viewModel});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Set the app bar title to 'Login'
        leading: IconButton(
          icon: Image.asset('delete_20dp_FILL0_wght400_GRAD0_opsz20.png',
        width: 24,
        height: 24,
        ), 
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: togglePasswordVisibility,
                    child: Container(
                      width: 16,
                      height: 16,
                      child: Image.asset(
                        _obscurePassword
                            ? 'assets/visibility_off_24dp_FILL0_wght400_GRAD0_opsz24.png' 
                            : 'assets/visibility_24dp_FILL0_wght400_GRAD0_opsz24.png', 
                        width: 16,
                        height: 16,

                      ),
                    ),
                  ),
                ),
                obscureText: _obscurePassword,
              ),
              SizedBox(height: 50.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Call the login method from the viewModel
                    widget.viewModel.login(
                      context,
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
