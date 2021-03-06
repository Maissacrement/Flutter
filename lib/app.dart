import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

/*class DynamicText extends StatelessWidget {
  
}*/
var titre = 'Mon titre';

const TextStyle style = TextStyle(
   color: Colors.blue,
   decoration: TextDecoration.underline,
   fontSize: 20,
   fontFamily: 'Arial'
);



class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);
  
  static const Alignment center = Alignment(0.0, 0.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
        actions: [
          IconButton(
            alignment: center,
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Ma nouvelle page', style: style),
                    ),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        SizedBox(
                          width: 200.0,
                          height: 300.0,
                          child: Card(child: Text('Hello World!')),
                        )
                      ],
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // ScrollView overflow -> scroll
        child: Column(  // On Affiche les elements a la suite en collone par default
        children: <Widget>[ // List de widget
          for (var i=0;i < 10;i++) SizedBox(  // La card prend la taille de la box
              width: double.infinity, // 100%
              height: 100,
              child: Card(
                child: Text('Hello $i')
              ),
          ),
        ],
      ),
        ) 
    );
  }
}