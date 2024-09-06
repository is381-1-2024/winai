import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _familyName;
  int _nameLength = 0;
  bool _showPassword = false;

  String? _validateTextField(String fieldName, String? value, int length) {
    if (value!.isEmpty) {
      return '$fieldName must not be empty';
    }

    if (value.length <= length) {
      return '$fieldName must longer than $length chars';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Fourth Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'What is your name',
                  labelText: 'Name *',
                  suffixText: '$_nameLength',
                ),
                validator: (value) {
                  return _validateTextField('Name', value, 6);
                },
                onSaved: (newValue) {
                  _name = newValue;
                },
                onChanged: (value) {
                  setState(() {
                    _nameLength = value.length;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Length: $_nameLength'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.group),
                    hintText: 'What is your surname?',
                    labelText: 'Family name *',
                  ),
                  validator: (value) => _validateTextField('Family name', value, 6),
                  onSaved: (newValue) => _familyName = newValue,
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.security),
                  suffixIcon: GestureDetector(
                    onLongPress: () async {
                      setState(() {
                        _showPassword = true;
                      });

                      await Future.delayed(Duration(
                        seconds: 5,
                      ));

                     setState(() {
                        _showPassword = false;
                      });
                    },
                    child: Icon(Icons.remove_red_eye),
                  ),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Your input is not valid.'),
                      ),
                    );

                    return;
                  }

                  _formKey.currentState!.save();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Hello $_name $_familyName'),
                    ),
                  );
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}