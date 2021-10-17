import 'package:flutter/material.dart';


class CardScreen extends StatelessWidget {
  final int numero;

  const CardScreen({required this.numero});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            width: double.infinity,
            height: size.height * 0.6,
            child: Stack(
              children: [
                Positioned(
                  bottom: 20,

                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.15,
                    decoration: Contenedor(Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Read more', style: TextStyle(color: Color(0xff664465), fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(width: 50,),
                          Icon(Icons.flag, color: Color(0xff664465),)
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.5,
                  decoration: Contenedor(Colors.red),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 100),
                          width: double.infinity,
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Color(0xff664465),
                            borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Unidad $numero', style: TextStyle(color: Colors.white, fontSize: 20),),
                              Divider(height: 20, color: Colors.white, endIndent: 300,),
                              Text('El proposito de esta unidad es enseñar a los niños a dialogar entre ellos', style: TextStyle(color: Colors.white, fontSize: 15),),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 90,
                          right: 20,
                          child: Text('0$numero',style: TextStyle(color: Colors.white, fontSize: 100)))
                    ],
                  ),
                ),
                
              ],
            ),
          ),
   );
  }

  BoxDecoration Contenedor(Color color) {
    return BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 0.2,
                    offset: Offset(0,7)
                  )
                ]
            );
  }
}