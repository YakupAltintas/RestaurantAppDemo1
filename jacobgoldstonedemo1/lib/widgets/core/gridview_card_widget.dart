import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/project_theme/project_colors.dart';

class GridViewCard extends StatefulWidget{
  GridViewCard({super.key,required this.onTab});
  Function() onTab ;

  @override
  State<GridViewCard> createState() => _GridViewCardState();
}

class _GridViewCardState extends State<GridViewCard> {
  ProjectColors colors = ProjectColors();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTab,
      child: Container(
        height: 250,
        padding:const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            image: const DecorationImage(
                image: AssetImage("assets/images/plate.png",)),
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  colors.homePageGreenColor,
                  colors.homePageGreenColor,
                  colors.favouiteBackroundColor
                ])),
        child: Column(children: [
         const SizedBox(height: 170,),
          Row(
            children: const [Text("Tavuk Çorbası"), SizedBox.shrink()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Row(children: [Icon(Icons.star,color: colors.starColor),const Text("4.8")],),Row(children: const [Text("10₺")],)],
          ),
        ]),
      ),
    );
  }
}
