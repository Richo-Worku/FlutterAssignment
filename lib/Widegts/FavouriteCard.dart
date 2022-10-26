import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_project/Models/charactermodel.dart';

import '../charactert.dart';
import 'customSnackBarContent.dart';

class FavouriteCard extends StatefulWidget {
  final String name;
  final String gender;
  final int id;
  final String image;
  final Results h;
  final List<Results> data;
  const FavouriteCard(
      {super.key,
      required this.name,
      required this.gender,
      required this.id,
      required this.image,
      required this.h,
      required this.data});

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  bool wassaved = true;

  insertToDrift(idd, names, gender) async {
    final database = MyDatabase();

    await database.into(database.character).insert(
        CharacterCompanion.insert(id: idd, name: names, gender: gender));

    final allcharacters = await database.select(database.character).get();
    //print('Characters in database: $allcharacters');
    print(allcharacters.length);

    //await database.delete(database.character).go();
    // print('Characters in database: $allcharacters');
  }

  checkexistance(id) async {
    final database = MyDatabase();

    final sami = await database.select(database.character)
      ..where((tbl) => tbl.id.equals(id));

    final data = await sami.get();

    if (data.length == 0) {
      setState(() {
        wassaved = false;
      });
    } else {
      wassaved = true;
    }
  }

  @override
  void initState() {
    checkexistance(widget.id);
    // TODO: implement initState
    super.initState();
  }

  bool issaved = false;

  @override
  Widget build(BuildContext context) {
    List<Results> savedWords = widget.data;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromARGB(28, 238, 183, 17),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1.4, color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.network(widget.image),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Color.fromARGB(255, 54, 53, 53),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '',
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 15, 15, 15)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.gender,
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 153, 38),
                              fontSize: 17),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        checkexistance(widget.id);
                        if (wassaved) {
                          print('sorry');
                          // issaved = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                              customeSnackBarContent(
                                  'Sorry',
                                  'Item exists in your Favourite List',
                                  Icons.person,
                                  Color.fromARGB(255, 209, 30, 10)));
                        } else {
                          insertToDrift(widget.id, widget.name, widget.gender);
                          setState(() {
                            issaved = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              customeSnackBarContent(
                                  'Sucess',
                                  'Added To Favourite',
                                  Icons.person,
                                  const Color(0xff116166)));
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.favorite,
                          color:
                              wassaved || issaved ? Colors.orange : Colors.grey,
                        ),
                        //color: Colors.orangeAccent,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
              ],
            ),
            // GestureDetector(
            //   onTap: () {
            //     deleteAccount(widget.id);
            //   },
            //   child: Icon(
            //     Icons.delete,
            //     size: 30,
            //     color: Color.fromARGB(255, 238, 63, 63),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
