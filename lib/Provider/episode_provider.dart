import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/Models/episodemodel.dart';
import 'package:new_project/Services/episode_service.dart';

final EpisodeDataProvider = FutureProvider<List<Episodes>>(((ref) async {
  return ref.read(episodeapiprovider).getEpisodeData();
}));
