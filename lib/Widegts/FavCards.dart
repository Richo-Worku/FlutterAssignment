import 'package:flutter/material.dart';
import 'package:new_project/charactert.dart';

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

Widget FavCards(String name, String string2, int id, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
                  ],
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
    ),
  );
}
