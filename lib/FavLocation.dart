import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_project/Models/charactermodel.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/locationt.dart';

import 'Widegts/Cards.dart';
import 'Widegts/FavCards.dart';

class FavLocation extends StatefulWidget {
  const FavLocation({Key? key}) : super(key: key);

  @override
  State<FavLocation> createState() => _FavLocationState();
}

class _FavLocationState extends State<FavLocation> {
  var list = <LocationData>[];
  var list2 = <LocationData>[];

  getdata() async {
    final database = MyDatabase();
    list = await database.select(database.location).get();

    setState(() {
      list2 = list;
    });
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.orange,
            )),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 252, 251, 251),
        title: Text(
          'Favourite Location',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height - 165,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return FavCards(list[index].name, list[index].type,
                              list[index].id, context);
                        },
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
