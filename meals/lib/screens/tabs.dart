import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/likes_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _likeMeal = [];

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Future<void> _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> availableMeal = ref.watch(mealsProvider).where((meal) {
      print(meal.title);
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) false;
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) false;
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) false;
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) false;
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeal,
    );

    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final likeMeals = ref.watch(likeMealsProvider);
      activePage = MealsScreen(
        title: 'Favorites',
        meals: likeMeals,
      );
      activePageTitle = 'My Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex, // 하이라이트 됨
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "카테고리",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "My Favorite",
          ),
        ],
      ),
    );
  }
}
