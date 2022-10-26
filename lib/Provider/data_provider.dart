import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Models/charactermodel.dart';
import 'package:new_project/Services/user_service.dart';

final userDataProvider = FutureProvider<List<Results>>(((ref) async {
  return ref.read(apiprover).getData();
}));
