import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/data_length.dart';

final DataLengthProviders =
    StateNotifierProvider.autoDispose<DataLengthProvider, DataLength>(
        (ref) => DataLengthProvider());

class DataLengthProvider extends StateNotifier<DataLength> {
  DataLengthProvider() : super(DataLength());

  void setLength(int datalength) {
    // var _left = state.left;
    state = state.copyWith(length: datalength);
  }

  void setIsLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  // void right() {
  //   var _left = state.right;
  //   state = state.copyWith(right: _left++);
  // }
}
