import 'package:first_app/components/name_card.dart';
import 'package:flutter/material.dart';

class SixthPage extends StatefulWidget{
  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {

   final List<dynamic> nameList = [
    ['Winai Nadee', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['Paul Smith', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['Orville Gibson', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['Leo Fender', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['Les Paul', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
    ['John Ibanez', 'xx / xx / xxxx', 'https://mentor2code.com/assets/img/logo-small.png'],
  ];

  String _chooseCard = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sixth Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                String result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CardListPage(
                      nameList: nameList,
                    ),
                  ),
                );

                setState(() {
                  _chooseCard = result;
                });
              },
              child: Text('Select card : $_chooseCard'),
            ),
          ],
        ),
      ),
    );
  }
}

class CardListPage extends StatelessWidget {
  const CardListPage({
    super.key,
    required this.nameList,
  });

  final List<dynamic> nameList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Select Name Card'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: nameList.length,
        itemBuilder: (context, index) {
          return NameCard(
            data: NameCardData(
              name: nameList[index][0],
              dob: nameList[index][1],
              imageUrl: nameList[index][2],
            ),
          );
        },
      ),
    );
  }

}
