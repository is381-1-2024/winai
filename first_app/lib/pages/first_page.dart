
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('First Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Page 1 is already here'),
                  ),
                );
                return;
              }

              Navigator.pushNamed(context, '/${index + 1}');
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text('Page ${index + 1}'),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

