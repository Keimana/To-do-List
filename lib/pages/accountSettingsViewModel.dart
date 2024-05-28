import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              'assets/delete_20dp_FILL0_wght400_GRAD0_opsz20.png', // Replace with the path to your back button icon
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              readOnly: true, // Prevent editing
              decoration: InputDecoration(
                hintText: 'Ronan@example.com',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Password',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              readOnly: true, // Prevent editing
              decoration: InputDecoration(
                hintText: '[Redacted]',
                border: OutlineInputBorder(),
              ),
            ),
            Text(
              'First Name:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              readOnly: true, // Prevent editing
              decoration: InputDecoration(
                hintText: 'Ronan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Last Name:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              readOnly: true, // Prevent editing
              decoration: InputDecoration(
                hintText: 'Baje',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Modify Settings'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Email'),
                          ),
                          SizedBox(height: 50),
                          TextField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                          ),
                          SizedBox(height: 56),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle saving email and password
                                  Navigator.pop(context);
                                },
                                child: Text('Save'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    "mail_24dp_FILL0_wght400_GRAD0_opsz24.png",
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Settings',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your delete account functionality here
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Delete Account'),
                      content: Text('Are you sure you want to delete your account?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle delete account logic
                            Navigator.pop(context);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    "delete_24dp_FILL0_wght400_GRAD0_opsz24.png", // Path to your delete account icon
                    width: 24,
                    height: 24,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10, width: 8),
                  Text(
                    'Delete Account',
                    style: TextStyle(color: const Color.fromARGB(255, 255, 17, 0)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 65),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the landing page
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(16),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
