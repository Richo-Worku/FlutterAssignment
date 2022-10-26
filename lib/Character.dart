import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Favcharacters.dart';
import 'package:new_project/Provider/data_provider.dart';
import 'package:new_project/Widegts/FavouriteCard.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 252, 251, 251),
            title: Text(
              'Characters',
              style: TextStyle(color: Colors.orange),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavCharacters()));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.orange,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _data.when(
                    data: (_data) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ..._data.map((e) => FavouriteCard(
                              name: e.name,
                              gender: e.gender,
                              id: e.id,
                              image: e.image,
                              h: e,
                              data: _data))
                        ],
                      );
                    },
                    error: (err, s) => Text(err.toString()),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )),
              ],
            ),
          )),
    );
  }
}
