import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(title: 'Favorites', meals: []);
      activePageTitle = 'My Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
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
