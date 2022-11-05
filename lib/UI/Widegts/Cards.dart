import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Data/Models/charactermodel.dart';

import '../Screens/charactert.dart';

final database = MyDatabase();

insertToDrift(idd, names, gender) async {
  final database = MyDatabase();

  await database
      .into(database.character)
      .insert(CharacterCompanion.insert(id: idd, name: names, gender: gender));

  final allcharacters = await database.select(database.character).get();
  print('Characters in database: $allcharacters');

  //await database.delete(database.character).go();
  print('Characters in database: $allcharacters');
}

Widget Cards(String name, String string2, int id, BuildContext context,
    String imgpath, WidgetRef ref, Results h) {
  var savedWords = <Results>[];

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
                child: Image.network(imgpath),
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
                    name,
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
                        string2,
                        style: TextStyle(
                            color: Color.fromARGB(255, 28, 153, 38),
                            fontSize: 17),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // bool issaved = savedWords.contains(h);
                      // print(issaved);]
                      insertToDrift(id, name, string2);
                      if (savedWords.contains(h)) {
                        print('exist');

                        // delete function
                      } else {
                        print('added');
                        savedWords.add(h);
                      }
                    },
                    child: Container(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey,
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
