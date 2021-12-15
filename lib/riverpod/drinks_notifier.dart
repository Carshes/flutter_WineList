import 'package:flutter/widgets.dart';
import 'package:smtutorial/models/drink.dart';

class DrinksNotifier extends ChangeNotifier {
  List<Drink> _drinks = [
    Drink("Penfolds Grange (1993)", false),
    Drink("Cabernet Sauvignon (2003)", false),
    Drink("Vega Sicily Unico (1974)", false),
    Drink("Jerez de la Fronteira (1775)", false),
    Drink("Pink Muscat Donkey (1836)", false),
    Drink("Chateau Mouton-Rothschild (1982)", false),
    Drink("Screaming Eagle (1992)", false),
    Drink("Heidsieck (1907)", false)
  ];

  void addDrink(Drink newDrink) {
    _drinks.add(newDrink);
    notifyListeners();
  }

  void removeDrink(Drink newDrink) {
    _drinks.remove(newDrink);
    notifyListeners();
  }

  void selectDrink(Drink drink, bool selected) {
    _drinks.firstWhere((element) => element.name == drink.name).selected =
        selected;
    notifyListeners();
  }

  List<Drink> get selectedDrinks =>
      _drinks.where((element) => element.selected).toList();

  List<Drink> get drinks => _drinks;
}
