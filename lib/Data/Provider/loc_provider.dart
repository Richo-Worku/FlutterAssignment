import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Data/Models/locationmodel.dart';
import 'package:new_project/Data/Services/loc_service.dart';

final LocDataProvider = FutureProvider<List<Locations>>(((ref) async {
  return ref.read(apiprovider).getLocationData();
}));
