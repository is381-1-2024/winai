import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Blank Page'),
      ),
      body: Center(
        child: Text('This page intentially blank'),
      ),
    );
  }
}