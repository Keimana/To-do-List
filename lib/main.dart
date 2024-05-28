import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homePageViewModel.dart';
import 'package:flutter_application_1/pages/landingPageViewModel.dart';
import 'package:flutter_application_1/pages/registrationScreenViewModel.dart';
import 'package:flutter_application_1/pages/LoginViewModel.dart' as LoginViewModel;

void main() {
  runApp(UserViewModel());
}

class UserViewModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainViewModel mainViewModel = MainViewModel();
    LoginViewModel.LoginScreen loginScreen = LoginViewModel.LoginScreen(viewModel: mainViewModel);
    RegistrationScreen registrationScreen = RegistrationScreen();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(
              loginViewModel: loginScreen,
              registrationViewModel: registrationScreen,
            ),
        '/todoList': (context) => HomePage(),
        '/registration': (context) => RegistrationScreen(),

      },
    );
  }
}


class MainViewModel {
  void login(BuildContext context, String email, String password) {
    // Implement login logic here
    // Example login logic:
    if (email == 'Ronan' && password == '123') {
      // Navigate to the TodoList screen if login is successful
      Navigator.pushReplacementNamed(context, '/todoList');
    } else {
      // Display error message if login fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Invalid email or password."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
