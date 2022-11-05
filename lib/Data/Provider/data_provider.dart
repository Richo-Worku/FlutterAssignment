import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Data/Models/charactermodel.dart';
import 'package:new_project/Data/Services/user_service.dart';

final userDataProvider = FutureProvider<List<Results>>(((ref) async {
  return ref.read(apiprover).getData();
}));
