import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_current_location.dart';
import 'package:new_restaurant_app/components/my_description_box.dart';
import 'package:new_restaurant_app/components/my_drawer.dart';
import 'package:new_restaurant_app/components/my_food_tile.dart';
import 'package:new_restaurant_app/components/my_sliver_app_bar.dart';
import 'package:new_restaurant_app/components/my_tab_bar.dart';
import 'package:new_restaurant_app/models/food.dart';
import 'package:new_restaurant_app/models/restaurant.dart';
import 'package:new_restaurant_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // todo: sort out and return a list of food items

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fillMenu) {
    return fillMenu.where((food) => food.category == category).toList();
  }

  // todo: return list of food in given category

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // todo: get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // todo: get individul food

          final food = categoryMenu[index];
          return MyFoodTile(
              food: food,
              onTab: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodPage(food: food),
                  )));
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                  title: MyTabBar(tabController: _tabController),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      // my current location
                      MyCurrentLocation(),

                      const MyDescriptionBox()
                    ],
                  ),
                ),
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu)),
          )),
    );
  }
}
