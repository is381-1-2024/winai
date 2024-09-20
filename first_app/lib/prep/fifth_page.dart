import 'package:first_app/prep/choice_card.dart';
import 'package:flutter/material.dart';

class FifthPage extends StatefulWidget {
  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  bool isMember = false;
  bool isAllYouCanEat = false;
  int noodleType = 0;
  int drinkType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Fifth Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('member=$isMember, allEat=$isAllYouCanEat'),
            Text('noodles=$noodleType, drink=$drinkType'),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('Membership'),
              value: isMember,
              onChanged:(bool? value) { 
                setState(() {
                  setState(() {
                    isMember = value!;
                  });
                });
              },
            ),
            CheckboxListTile(
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('All you can eat'),
              value: isAllYouCanEat,
              onChanged:(bool? value) {
                setState(() {
                  isAllYouCanEat = value!;
                });
              },
            ), 
            ChoiceCard(
              choiceData: ChoiceData(
                title: "Noodles", 
                choices: ["Senyai", "Senlek", "Senmee", "Bamee"],
                groupValue: noodleType,
                onChanged: (int newValue) {
                  setState(() {
                    noodleType = newValue;
                  });
                },
              ),
            ),
            ChoiceCard(
              choiceData: ChoiceData(
                title: "DrinkType", 
                choices: ["Hot", "Iced", "Frappe"],
                groupValue: drinkType,
                onChanged: (int newValue) {
                  setState(() {
                    drinkType = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

