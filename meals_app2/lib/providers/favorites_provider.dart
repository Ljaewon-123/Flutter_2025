import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app2/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() :super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite) {
      state = state.where((m) => m.id != m.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }

  }
}

// StateNotifierProvider 변경할수있는 데이터에 유용함 
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});