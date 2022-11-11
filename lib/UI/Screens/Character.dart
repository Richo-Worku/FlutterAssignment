import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Data/Provider/data_length_provider.dart';
import 'package:new_project/Data/Provider/data_provider.dart';
import '../Widegts/NewFavCharCard.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    final state = ref.watch(DataLengthProviders);
    final controller = ref.read(DataLengthProviders.notifier);
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
              Container(
                margin: EdgeInsets.only(top: 20, right: 10),
                child: GestureDetector(
                    onTap: () {
                      controller.setLength(_data.when(
                          data: ((data) => data.length),
                          error: ((error, stackTrace) {
                            return 0;
                          }),
                          loading: (() {
                            return 1;
                          })));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const FavCharacters()));
                    },
                    child: Text(
                      state.length == 0 ? 'See Total' : state.length.toString(),
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _data.when(
                    data: (_data) {
                      //  print(_data.length);
                      // controller.setLength(_data.length);
                      print(state.length);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ..._data.map(
                            (e) => NewCard(
                                name: e.name,
                                gender: e.gender,
                                id: e.id,
                                image: e.image,
                                h: e,
                                data: _data),
                          ),
                          SizedBox(
                            height: 15,
                          )
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
