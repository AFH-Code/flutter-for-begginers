import 'package:flutter/material.dart';
import 'dart:convert';
import './pizza.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity
            .adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON')),
      body: Container(
        child: FutureBuilder(
            future: readJsonFile(),
            builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas){
              return ListView.builder(
                  itemCount: pizzas.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) {
                    return ListTile(
                      title: Text(pizzas.data![position].pizzaName ?? 'Noel'),
                      subtitle: Text((pizzas.data![position].description ?? '') + ' - € '+ (pizzas.data![position].price?.toString() ?? '')),
                    );
                  }
              );
            }
        ),
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List myMap = jsonDecode(myString);
    List<Pizza> myPizzas = [];

    myMap.forEach((dynamic pizza) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    });
    return myPizzas;
  }
}
