import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget{
  const ChoiceCard({
    super.key,
    required this.choiceData,
  });

  final ChoiceData choiceData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(choiceData.choices.length+1, (index) { 
          if (index == 0) {
            return Text(choiceData.title);
          }
      
          return ChoiceRadio(
            label: choiceData.choices[index-1],
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: index,
            groupValue: choiceData.groupValue,
            onChanged: (int newValue) {
              choiceData.onChanged(newValue);
            },
          );
        }),
      ),
    );
  }
}

class ChoiceData {
  const ChoiceData({
    required this.title,
    required this.choices,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final List<String> choices;
  final int groupValue;
  final ValueChanged<int> onChanged;
}

class ChoiceRadio extends StatelessWidget {
  const ChoiceRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<int>(
              groupValue: groupValue,
              value: value,
              onChanged: (int? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}