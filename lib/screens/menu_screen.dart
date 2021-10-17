import 'dart:ui';

import 'package:esquema_unidades/widgets/card.dart';
import 'package:esquema_unidades/widgets/card_screen.dart';
import 'package:flutter/material.dart';


class MenuScreen extends StatefulWidget {

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late PageController controller;
  double page = 0.0;

  @override
  void initState() {
    controller = new PageController(
      viewportFraction: 0.8
    );
    controller.addListener(listener);
    super.initState();
  }
  void listener() { 
      setState(() {
        page = controller.page!;
      });
    }
  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:Column(
          children: [
            Expanded(child: Container(),),
            Container(
              width: double.infinity,
              height: size.height * 0.65,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (_, index){
                  double result = (index - page).abs();
                return Transform(
                  alignment: Alignment.topCenter,
                  transform: Matrix4.identity()
                  ..translate(0.0,result*40)
                  ..scale(lerpDouble(0.9, 0.9, result))
                  ,
                  child:
                   Card2(title: 'Unidad ${index+1}', subtitle: 'El proposito de esta unidad es enseñar a los niños a dialogar entre ellos', index:index+1, result:result)
                  //  CardScreen(numero: index,)
                   );
              }),
            ),
      Expanded(child: Container(),),
          ],
        ),
   );
  }
}