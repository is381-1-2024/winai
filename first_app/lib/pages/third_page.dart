
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Third Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/1');
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show msg'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Hello'),
                action: SnackBarAction(
                  label: 'Okay',
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}