import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/FavEpisode.dart';
import 'package:new_project/Favcharacters.dart';
import 'package:new_project/Models/charactermodel.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Provider/data_provider.dart';
import 'package:new_project/Provider/loc_provider.dart';
import 'package:new_project/Widegts/EpisodeCard.dart';
import 'package:new_project/Widegts/FavEpisodeCard.dart';

import 'Provider/episode_provider.dart';
import 'Widegts/Cards.dart';

class Episode extends ConsumerWidget {
  const Episode({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(EpisodeDataProvider);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 252, 251, 251),
            title: Text(
              'Episodes',
              style: TextStyle(color: Colors.orange),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavEpisode()));
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
                          ..._data.map((e) => FavEpisodeCard(
                              name: e.name, episode: e.episode, id: e.id))
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

    // TODO: implement build
    throw UnimplementedError();
  }
}
