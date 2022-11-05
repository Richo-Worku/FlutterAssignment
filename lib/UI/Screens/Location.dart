import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Data/Provider/loc_provider.dart';

import 'package:new_project/UI/Screens/FavLocation.dart';
import 'package:new_project/UI/Widegts/FavLocationCard.dart';

class Location extends ConsumerWidget {
  const Location({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(LocDataProvider);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 252, 251, 251),
            title: Text(
              'Locations',
              style: TextStyle(color: Colors.orange),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavLocation()));
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
                          ..._data.map((e) => FavLocationCard(
                              name: e.name, type: e.type, id: e.id))
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
