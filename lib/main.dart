import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
// A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  Color _getActiveColor() {
    if (_counter <= 30) {
      return Colors.red;
    } else if (_counter <= 70) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

//set counter value
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
//set up the widget alignement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: _getActiveColor(),
              child: Text(
//to displays current number
                '$_counter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: _getActiveColor(),
            inactiveColor: Colors.black,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 160),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
        FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _counter = (_counter - 1).clamp(0, 100).toInt(); // never < 0
                });
              },
              icon: const Icon(Icons.remove_circle_outline),
              label: const Text('Abort'),
            ),

        FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              _counter = (_counter + 1).clamp(0, 100);
            });
          },
          icon: const Icon(Icons.local_fire_department),
          label: const Text('Ignite'),
        ),
        FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              icon: const Icon(Icons.autorenew),
              label: const Text('Reset'),
            ),
          ],
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
