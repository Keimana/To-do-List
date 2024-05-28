import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/LoginViewModel.dart';
import 'package:flutter_application_1/pages/registrationScreenViewModel.dart';

class LandingPage extends StatelessWidget {
  final LoginScreen loginViewModel;
  final RegistrationScreen registrationViewModel;

  LandingPage({
    required this.loginViewModel,
    required this.registrationViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your images here
            Image.asset(
              'assets/landingPagePhoto.png', // Replace with your image asset path
              width: 400.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Make Your Tasks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Organized',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            SizedBox(height: 25.0),
            SizedBox(
              width: 450.0, // Adjust the width of the buttons
              height: 40.0, // Adjust the height of the buttons
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginViewModel),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 24, 24, 24)), // Set background color of the button
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // Set text color of the button
                ),
                child: Text('Login', style: TextStyle(fontSize: 20.0)),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 450.0, // Adjust the width of the buttons
              height: 40.0, // Adjust the height of the buttons
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => registrationViewModel),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.black), // Set text color of the button
                ),
                child: Text('Register', style: TextStyle(fontSize: 20.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
