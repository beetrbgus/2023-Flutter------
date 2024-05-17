import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class LikeMealsNotifier extends StateNotifier<List<Meal>> {
  LikeMealsNotifier() : super([]);

  bool toggleMealLikeStatus(Meal meal) {
    final mealIsLike = state.contains(meal);
    if (mealIsLike) {
      state = state.where((m) => m.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

final likeMealsProvider = StateNotifierProvider<LikeMealsNotifier, List<Meal>>(
  (ref) {
    return LikeMealsNotifier();
  },
);
