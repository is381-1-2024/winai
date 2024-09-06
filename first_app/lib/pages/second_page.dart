
import 'package:first_app/components/name_card.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100, 600];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Second Page'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: entries.length,
        separatorBuilder: (context, index) {
          return Divider();
      },
        itemBuilder: (context, index) {
          return Container(
            height: 250,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Column(
                children: [
                  Text('Item ${entries[index]}'),
                  NameCard(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
