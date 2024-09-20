import 'package:flutter/material.dart';

class NameCardEasy extends StatelessWidget {
  const NameCardEasy({
    super.key,
    required this.name,
    required this.dob,
    required this.imageUrl,
  });


  final String name;
  final String dob;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class NameCardData {
  const NameCardData({
    required this.name,
    required this.dob,
    required this.imageUrl,
  });

  final String name;
  final String dob;
  final String imageUrl;
}

class NameCard extends StatelessWidget {
  const NameCard({
    super.key,
    required this.data,  
  });

  final NameCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150.0,
            child: Image.network(data.imageUrl),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${data.name}'),
              Text('DOB: ${data.dob}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, data.name);
                },
                child: Text('Select'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}