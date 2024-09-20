import 'package:first_app/components/choice_card.dart';
import 'package:flutter/material.dart';

class FifthPage extends StatefulWidget{
  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  bool isMember = false;
  bool isAllYouCanEat = false;
  int sweetLevel = 0;
  int spicyLevel = 4;

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
            Text('Member=$isMember, AllEat=$isAllYouCanEat'),
            Text('Sweet=$sweetLevel, Spicy=$spicyLevel'),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('Membership'),
              value: isMember,
              onChanged:(bool? value) { 
                setState(() {
                  isMember = value!;
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
                title: "Sweet Level",
                choices: [
                  "150%", "125%", "100%", "75%", "50%", "25%",
                ],
                groupValue: sweetLevel,
                onChanged: (int newValue) {
                  setState(() {
                    sweetLevel = newValue;
                  });
                },
              ),
            ),
            ChoiceCard(
              choiceData: ChoiceData(
                title: "Spicy Level",
                choices: [
                  "Super Spicy", "Hot", "Spicy Hot", "Not Spicy",
                ],
                groupValue: spicyLevel,
                onChanged: (int newValue) {
                  setState(() {
                    spicyLevel = newValue;
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