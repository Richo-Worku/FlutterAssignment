import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Models/charactermodel.dart';
import 'package:new_project/Models/locationmodel.dart';
import 'package:new_project/Services/loc_service.dart';
import 'package:new_project/Services/user_service.dart';

final LocDataProvider = FutureProvider<List<Locations>>(((ref) async {
  return ref.read(apiprovider).getLocationData();
}));
