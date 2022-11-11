// import 'dart:core';

// import 'package:flutter/material.dart';



// class FavLocationCard extends StatefulWidget {
//   final String name;
//   final String type;
//   final int id;

//   const FavLocationCard({
//     super.key,
//     required this.name,
//     required this.type,
//     required this.id,
//   });

//   @override
//   State<FavLocationCard> createState() => _FavLocationCardState();
// }

// class _FavLocationCardState extends State<FavLocationCard> {
//   bool wassaved = true;

//   insertToDrift(idd, names, gender) async {
//     final database = MyDatabase();
//     await database
//         .into(database.location)
//         .insert(LocationCompanion.insert(id: idd, name: names, type: gender));

//     final allcharacters = await database.select(database.location).get();
//     print('Characters in database: $allcharacters');

//     //await database.delete(database.character).go();
//     print('Characters in database: $allcharacters');
//   }

//   checkexistance(id) async {
//     final database = MyDatabase();

//     final sami = await database.select(database.location)
//       ..where((tbl) => tbl.id.equals(id));

//     final data = await sami.get();

//     if (data.length == 0) {
//       setState(() {
//         wassaved = false;
//       });
//     } else {
//       wassaved = true;
//     }
//   }

//   @override
//   void initState() {
//     checkexistance(widget.id);
//     super.initState();
//   }

//   bool issaved = false;

//   @override
//   Widget build(BuildContext context) {
//     //List<Results> savedWords = widget.data;

//     return Container(
//       margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: Color.fromARGB(28, 238, 183, 17),
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(width: 1.4, color: Colors.white)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 //no images link available for locations
//                 //  child: Image.network(widget.image),
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.name,
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 54, 53, 53),
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '',
//                     style: TextStyle(
//                         letterSpacing: 1.2,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 15, 15, 15)),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         widget.type,
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 28, 153, 38),
//                             fontSize: 17),
//                       ),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       checkexistance(widget.id);
//                       if (wassaved) {
//                         print('sorry');
//                         // issaved = false;
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             customeSnackBarContent(
//                                 'Sorry',
//                                 'Item exists in your Favourite List',
//                                 Icons.person,
//                                 Color.fromARGB(255, 209, 30, 10)));
//                       } else {
//                         insertToDrift(widget.id, widget.name, widget.type);
//                         setState(() {
//                           issaved = true;
//                         });
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             customeSnackBarContent(
//                                 'Sucess',
//                                 'Added To Favourite',
//                                 Icons.person,
//                                 const Color(0xff116166)));
//                       }
//                     },
//                     child: Container(
//                       child: Icon(
//                         Icons.favorite,
//                         color:
//                             wassaved || issaved ? Colors.orange : Colors.grey,
//                       ),
//                       //color: Colors.orangeAccent,
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//           // GestureDetector(
//           //   onTap: () {
//           //     deleteAccount(widget.id);
//           //   },
//           //   child: Icon(
//           //     Icons.delete,
//           //     size: 30,
//           //     color: Color.fromARGB(255, 238, 63, 63),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
