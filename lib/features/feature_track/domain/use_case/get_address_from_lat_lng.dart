import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:okoa/di/di.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import '../repository/track_repository.dart';

class GetAddressFromLatLng {
  final repo = locator.get<TrackRepository>();

  Future<String> call({required LatLng coordinates}) async =>
      await repo.getAddressFromLatLng(coordinates: coordinates);
}
