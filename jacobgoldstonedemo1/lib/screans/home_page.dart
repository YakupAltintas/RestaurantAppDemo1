import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/project_theme/project_colors.dart';
import 'package:jacobgoldstonedemo1/project_theme/project_texts.dart';
import 'package:jacobgoldstonedemo1/screans/detail_page.dart';
import 'package:jacobgoldstonedemo1/widgets/core/category_button_widget.dart';
import 'package:jacobgoldstonedemo1/widgets/core/gridview_card_widget.dart';
import 'package:jacobgoldstonedemo1/widgets/core/large_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ProjectTexts, ProjectColors {
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
  }

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
      print(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: homePageGreenColor,
      appBar: _appbarWidget(),
      drawer: _drawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const _emptyWidget(),
          LargeText(text: "Favori Yemeğin Hangisi ?", size: 31),
          const _emptyWidget(),
          _SearchingTextField(
              detailCardBackgroundColor: detailCardBackgroundColor,
              homePageTextFieldLabel: homePageTextFieldLabel),
          const _emptyWidget(),
          LargeText(text: homePageCatageri, size: 17),
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
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              children: List.generate(25, (index) {
                return GridViewCard(onTab: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(),));
                },);
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

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        onTap: onTap,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ]);
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
