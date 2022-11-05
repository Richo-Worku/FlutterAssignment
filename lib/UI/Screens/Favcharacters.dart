import 'package:flutter/material.dart';

import '../Widegts/FavCards.dart';
import 'charactert.dart';

class FavCharacters extends StatefulWidget {
  const FavCharacters({Key? key}) : super(key: key);

  @override
  State<FavCharacters> createState() => _FavCharactersState();
}

class _FavCharactersState extends State<FavCharacters> {
  var list = <CharacterData>[];
  var list2 = <CharacterData>[];

  getdata() async {
    final database = MyDatabase();
    list = await database.select(database.character).get();

    setState(() {
      list2 = list;
    });
  }

  @override
  void initState() {
    getdata();
    // getCharacters();
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
          'Favourite Characters',
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
                          return FavCards(list[index].name, list[index].gender,
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
