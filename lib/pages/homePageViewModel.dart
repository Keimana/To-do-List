import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/accountSettingsViewModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> todoItems = [];
  final TextEditingController _textEditingController = TextEditingController();

  void _addSubject(String subject) {
    setState(() {
      todoItems.add(TodoItem(subject: subject, isChecked: false));
      _textEditingController.clear();
    });
  }

  void _editSubject(int index) {
    TextEditingController controller = TextEditingController(text: todoItems[index].subject);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit List'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter new list'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todoItems[index] = TodoItem(subject: controller.text, isChecked: todoItems[index].isChecked);
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteSubject(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete List'),
          content: Text('Are you sure you want to delete?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  todoItems.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 1) {
      // Navigate to AccountSettingsPage when the Account Settings tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountSettingsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back button
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Hello, Ronan!',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 0, // Remove the shadow below the app bar
      ),
      backgroundColor: Colors.white, // Set the background color to white
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add List'),
                      content: SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(labelText: 'Enter List'),
                            ),
                            SizedBox(height: 16), // Add some vertical space
                            SizedBox(
                              width: double.infinity, // Make the button fill the available width
                              child: ElevatedButton(
                                onPressed: () {
                                  _addSubject(_textEditingController.text);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(vertical: 12), // Increase vertical padding
                                ),
                                child: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/add_24dp_FILL0_wght400_GRAD0_opsz24.png', 
                width: 24,
                height: 24,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/lists_20dp_FILL0_wght400_GRAD0_opsz20.png')), // Custom icon for To-Do List
            label: 'To-Do List',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/settings_20dp_FILL0_wght400_GRAD0_opsz20.png')), // Custom icon for Account Settings
            label: 'Account Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.asset(
                  'assets/article_24dp_FILL0_wght400_GRAD0_opsz24.png', // Path to your icon image
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'Things To-do',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Add a border around the container
                    borderRadius: BorderRadius.circular(8), // Optional: Add border radius for rounded corners
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4), // Add some vertical spacing between list items
                  child: ListTile(
                    leading: Checkbox(
                      value: todoItems[index].isChecked,
                      onChanged: (value) {
                        setState(() {
                          todoItems[index].isChecked = value!;
                        });
                      },
                    ),
                    title: Text(todoItems[index].subject),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _editSubject(index);
                          },
                          child: Image.asset(
                            'assets/edit_24dp_FILL0_wght400_GRAD0_opsz24.png', // Replace with your custom edit icon path
                            width: 24,
                            height: 24,
                          ),
                        ),
                        SizedBox(width: 8), // Add some space between icons
                        GestureDetector(
                          onTap: () {
                            _deleteSubject(index);
                          },
                          child: Image.asset(
                            'assets/delete_24dp_FILL0_wght400_GRAD0_opsz24.png', // Replace with your custom delete icon path
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  String subject;
  bool isChecked;

  TodoItem({required this.subject, required this.isChecked});
}
