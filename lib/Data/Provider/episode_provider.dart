import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Data/Models/episodemodel.dart';
import 'package:new_project/Data/Services/episode_service.dart';

final EpisodeDataProvider = FutureProvider<List<Episodes>>(((ref) async {
  return ref.read(episodeapiprovider).getEpisodeData();
}));
