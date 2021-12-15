import 'package:cubit/cubit.dart';
import 'package:replay_cubit/replay_cubit.dart';
import 'package:smtutorial/models/drink.dart';

class DrinksCubit extends ReplayCubit<List<Drink>> {
  DrinksCubit()
      : super([
          Drink("Penfolds Grange (1993)", false),
          Drink("Cabernet Sauvignon (2003)", false),
          Drink("Vega Sicily Unico (1974)", false),
          Drink("Jerez de la Fronteira (1775)", false),
          Drink("Pink Muscat Donkey (1836)", false),
          Drink("Chateau Mouton-Rothschild (1982)", false),
          Drink("Screaming Eagle (1992)", false),
          Drink("Heidsieck (1907)", false)
        ]);

  void addDrink(Drink newDrink) => emit(state..add(newDrink));

  void removeDrink(Drink newDrink) {
    state.remove(newDrink);
    emit(state);
  }

  void selectDrink(Drink drink, bool selected) {
    var list = [...state];
    list.firstWhere((element) => element.name == drink.name).selected =
        selected;
    emit(list);
  }

  @override
  void onTransition(Transition<List<Drink>> transition) {
    print("Cubit itself: $transition");
    super.onTransition(transition);
  }
}
