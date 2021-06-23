import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        resetCount();
        break;
      case 1:
        decrement();
        break;
      case 2:
        increment();
        break;
    }
  }

  void increment() {
    count++;
    setState(() {});
  }

  void decrement() {
    if (count > 0) {
      count--;
    } else {
      count = 0;
    }
    setState(() {});
  }

  void resetCount() {
    count = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter App",
        ),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            text: "Counter:\n",
            children: <TextSpan>[
              TextSpan(
                text: '$count',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ],
            style: TextStyle(fontSize: 24),

            // textScaleFactor: 2.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.undo,
              color: Colors.blue,
              size: 36.0,
            ),
            label: 'Reset',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.remove,
              color: Colors.red,
              size: 36.0,
            ),
            label: 'Remove',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.green,
              size: 36.0,
            ),
            label: 'Add',
          ),
        ],
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
