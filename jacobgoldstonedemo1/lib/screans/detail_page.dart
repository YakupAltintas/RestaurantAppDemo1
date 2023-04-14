import 'package:flutter/material.dart';
import 'package:jacobgoldstonedemo1/project_theme/project_colors.dart';
import 'package:flutter/services.dart';
import 'package:jacobgoldstonedemo1/widgets/core/large_text_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with ProjectColors {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: favouiteBackroundColor,
        appBar: _appBar(),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 300,
                child: Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: favouiteBackroundColor,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/plate.png"))),
                ),
              ),
              Positioned(
                  top: 280,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [LargeText(text: "Tavuk Çorbası", size: 25),LargeText(text:"15₺",size: 25,)],),

                      _emptyWidget(10),

                      
                    ]),
                  ))
            ],
          ),
        ));
  }

  SizedBox _emptyWidget(double height) => SizedBox(height: height,);

  AppBar _appBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon:const Icon(Icons.favorite_outline_rounded, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
        leading: Row(
          children: const [
            SizedBox(width: 20),
            Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
            ),
          ],
        ));
  }
}
