
import 'dart:ui';

import 'package:flutter/material.dart';
class Card2 extends StatelessWidget {
   Card2({
     this.borderColor = Colors.red, required this.title,required  this.subtitle, required this.index, required this.result,
  }) ;

   final Color borderColor;
   final String title;
   final String subtitle;
   final int index;
   final double result;

  @override
  Widget build(BuildContext context) {
    final valor = -1.5*result +1;
    final opa = valor.clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.9,
                    blurRadius: 20,
                    offset: Offset(0,10)
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Opacity(
                  opacity: opa,
                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Escalar(Text('0$index', style: TextStyle(fontSize: 90, color: Color(0xff1C1C39)),),),
                        SizedBox(height: 20,),
                        Trasladar(Text('$title', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xff303474)),),0),
                        
                        SizedBox(height: 10,),
                        Trasladar(Text('$subtitle',textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.black45,),),0.5),
                        SizedBox(height: 50,),
                        Trasladar(ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff1C1C39),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            child: Text('Ver', style: TextStyle(fontSize: 20),),
                          )),0.8)
                      ],
                    ),
                ),
              ),
          ))
        ],
      ),
    );
  }

  Transform Trasladar(Widget child, double delay) {
    return Transform(
                  transform: Matrix4.identity()
                  ..translate(0.0,lerpDouble(0.0, result * 80, result + delay)!.toDouble())
                  ,
                  child:child);
  }

  Transform Escalar(Widget child) {
    final valor = -1.5*result +1;
    
    return Transform(
      alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..scale(lerpDouble(0.1, 1.0, valor))
                  ,
                  child:child);
  }
}

