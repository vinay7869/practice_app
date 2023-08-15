import 'package:flutter/material.dart';

class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  String? _isSelected;
  List<String> chip = ['Hi', 'Hello', 'kasi hay', 'Labble', 'hjshb', 'hi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      children: chip
                          .map((String chip) => ChoiceChip(
                                label: Text(chip),
                                selected: _isSelected == chip,
                                selectedColor: Colors.amber,
                                backgroundColor: Colors.black12,
                                onSelected: (value) {
                                  setState(() {
                                    _isSelected = value ? chip : null;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    Wrap(
                      children: chip
                          .map((e) => Radio(
                                value: e,
                                groupValue: _isSelected,
                                onChanged: (value) {
                                  setState(() {
                                    _isSelected = value;
                                  });
                                },
                              ))
                          .toList(),
                    )
                  ],
                );
              })),
    );
  }
}


