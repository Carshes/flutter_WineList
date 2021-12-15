import 'package:flutter/material.dart';
import 'package:smtutorial/models/drink.dart';
import 'package:smtutorial/widgets/drinks_widget.dart';

import '../constants.dart';

// Widget
class CheckBoxSetStateScreen extends StatefulWidget {
  @override
  _CheckBoxSetStateScreenState createState() => _CheckBoxSetStateScreenState();
}

class _CheckBoxSetStateScreenState extends State<CheckBoxSetStateScreen> {
  List<Drink> drinks = [
    Drink("Penfolds Grange (1993)", false),
    Drink("Cabernet Sauvignon (2003)", false),
    Drink("Vega Sicily Unico (1974)", false),
    Drink("Jerez de la Fronteira (1775)", false),
    Drink("Pink Muscat Donkey (1836)", false),
    Drink("Chateau Mouton-Rothschild (1982)", false),
    Drink("Screaming Eagle (1992)", false),
    Drink("Heidsieck (1907)", false)
  ];

  @override
  Widget build(BuildContext context) {
    var selectedDrinks = drinks.where((element) => element.selected);

    return Scaffold(
      appBar: AppBar(
        title: Text("Wine list"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Drinks tonight",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ...drinks
                      .map(
                        (drink) => DrinksWidget(
                          drink: drink,
                          onChanged: (value) {
                            setState(() {
                              drink.selected = value;
                            });
                          },
                        ),
                      )
                      .toList(),
                  Text(
                    "The order is: ",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          selectedDrinks.toList()[index].name,
                        ),
                      ),
                      itemCount: selectedDrinks.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
