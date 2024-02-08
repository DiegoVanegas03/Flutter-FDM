import 'package:flutter/material.dart';
import 'package:app2/constantes.dart' as constantes;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CardPersonalizate(txt:'Personalizado 1', size: 20, showOrHide: false,),
              CardPersonalizate(txt:'Personalizado 2',size: 25, showOrHide: true),
              CardPersonalizate(txt:'Personalizado 3',size: 7, showOrHide: true),
            ],
          )
        ],
      ),
    );
  }
}

class CardPersonalizate extends StatelessWidget {
  const CardPersonalizate({
    super.key,
    required this.txt,
    required this.size,
    required this.showOrHide,
  });

  final String txt;
  final double size;
  final bool showOrHide;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: constantes.colorPrincipal,
      elevation: 10,
      child: Padding(
          padding: EdgeInsets.all(size),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child:  Text(txt),
              ),
              Expanded(
                flex: 4,
                child: Container(color: Colors.white, height: 20,),
              ),
              Expanded(
                flex: 2,
                child: showOrHide ? const Icon(Icons.sms) : Container(),
              ),
            ],
          ),
        )
    );
  }
}
