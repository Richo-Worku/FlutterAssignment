import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/FavEpisode.dart';
import 'package:new_project/Widegts/FavEpisodeCard.dart';

import 'Provider/episode_provider.dart';

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
  }
}
