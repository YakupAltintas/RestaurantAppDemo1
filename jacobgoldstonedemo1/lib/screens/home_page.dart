import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/core/project_theme/project_colors.dart';
import 'package:jacobgoldstonedemo1/core/project_theme/project_texts.dart';
import 'package:jacobgoldstonedemo1/core/widgets/medium_headline_text_widget.dart';
import 'package:jacobgoldstonedemo1/core/widgets/small_headline_text_widget.dart';
import 'package:jacobgoldstonedemo1/screens/cart_page.dart';
import 'package:jacobgoldstonedemo1/screens/detail_page.dart';
import 'package:jacobgoldstonedemo1/screens/favourite_page.dart';
import 'package:jacobgoldstonedemo1/screens/profile_page.dart';
import 'package:jacobgoldstonedemo1/core/widgets/category_button_widget.dart';
import 'package:jacobgoldstonedemo1/core/widgets/gridview_items_widget.dart';
import '../core/widgets/large_headline_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with ProjectTexts, ProjectColors, TickerProviderStateMixin {
  late List<String> categoryList = [
    "Et",
    "Tavuk",
    "Vegan",
    "Fırın",
    "Stack",
    "Pizza"
  ];
  int _selectedCategoryIndex = -1;
  int _selectedProductIndex = -1;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  int SelectedNavBar = 0;

  void onTap(int index) {
    SelectedNavBar = index;
  }

  late final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            bottomNavigationBar: _bottomAppBar(),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                _HomePage(context),
                FavouritePage(),
                CartPage(),
                ProfilePage()
              ],
            )));
  }

  Scaffold _HomePage(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: homePageGreenColor,
      appBar: _appbarWidget(),
      drawer: _drawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const _emptyWidget(),
          LargeText(
            text: homePageSlogane,
          ),
          const _emptyWidget(),
          _SearchingTextField(
              detailCardBackgroundColor: detailCardBackgroundColor,
              homePageTextFieldLabel: homePageTextFieldLabel),
          const _emptyWidget(),
          SmallTitle(
            text: homePageCatagory,
          ),
          const _emptyWidget(),
          _categoryButtons(),
          const _emptyWidget(),
          _CategoryDetails(context),
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded _CategoryDetails(BuildContext context) {
    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              children: List.generate(10, (index) {
                return GridViewCard(
                  onTab: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(),
                    ));
                  },
                );
              }))),
    );
  }

  SizedBox _categoryButtons() {
    return SizedBox(
      height: 35,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryButton(
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              text: categoryList[index],
              backgroundColor: _selectedCategoryIndex == index
                  ? selectedItemColor
                  : detailCardBackgroundColor,
              textColor: _selectedCategoryIndex == index
                  ? Colors.white
                  : generalTextColor);
        },
      ),
    );
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
        elevation: 0,
        color: favouiteBackroundColor,
        surfaceTintColor: Colors.black,
        child: TabBar(
          controller: tabController,
          tabs: const [
            Tab(child: Icon(Icons.home_outlined)),
            Tab(icon: Icon(Icons.favorite_border_rounded)),
            Tab(icon: Icon(Icons.shopping_cart_outlined)),
            Tab(icon: Icon(Icons.person_2_outlined)),
          ],
        ));
  }

  AppBar _appbarWidget() {
    return AppBar(
      iconTheme: IconThemeData(color: generalTextColor),
      backgroundColor: homePageGreenColor,
      elevation: 0,
      centerTitle: true,
      title: Text(homePageTitle, style: TextStyle(color: generalTextColor)),
      actions: const [
        CircleAvatar(
            radius: 20, backgroundImage: AssetImage("assets/images/plate.png")),
        SizedBox(width: 20)
      ],
    );
  }
}

class _SearchingTextField extends StatelessWidget {
  const _SearchingTextField({
    required this.detailCardBackgroundColor,
    required this.homePageTextFieldLabel,
  });

  final Color detailCardBackgroundColor;
  final String homePageTextFieldLabel;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      suffixIcon: Icon(
        Icons.search_outlined,
        color: detailCardBackgroundColor,
        size: 35,
      ),
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0),
          borderRadius: BorderRadius.circular(20)),
      label: Text(homePageTextFieldLabel),
    ));
  }
}

// ignore: camel_case_types
class _drawerWidget extends StatelessWidget with ProjectColors {
  _drawerWidget();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.black,
      backgroundColor: homePageGreenColor,
    );
  }
}

// ignore: camel_case_types
class _emptyWidget extends StatelessWidget {
  const _emptyWidget();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

enum PageNames { home, favourite, cart, profile }
