import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filers.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _facvoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message)
      )
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _facvoriteMeals.contains(meal);

    if(isExisting) {
      setState(() {
        _facvoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite');
    }
    else {
      setState(() {
        _facvoriteMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite!');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void  _setScreent(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == 'filters') {
      // pushReplacement
      final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => FiltersScreen()));

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CatetoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus);
    var activePageTitle = 'Categorids';

    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: _facvoriteMeals, onToggleFavorite: _toggleMealFavoriteStatus);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreent,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar( 
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Cateoryies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}