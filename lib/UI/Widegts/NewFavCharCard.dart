import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Data/Models/charactermodel.dart';

class NewCard extends StatefulWidget {
  final String name;
  final String gender;
  final int id;
  final String image;
  final Results h;
  final List<Results> data;
  const NewCard(
      {super.key,
      required this.name,
      required this.gender,
      required this.id,
      required this.image,
      required this.h,
      required this.data});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.only(bottom: 10, left: 20, top: 20),
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 10, top: 15, bottom: 10),
                  height: 120,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 203, 187, 141),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.image))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                widget.gender,
                                style: GoogleFonts.abel(color: Colors.black),
                              ),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.orange,
                            //     borderRadius: BorderRadius.circular(5),
                            //   ),
                            //   child: Icon(Icons.add),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                  //  color: Colors.pink,
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(28, 238, 183, 17)),
            height: 210,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
