import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

abstract class TrackRepository {
  /// Request Location Service
  Future<void> requestLocationService();

  /// Listen to Current Location
  void listenToCurrentLocation(
      {required Function(LocationData locationData) onLocationChanged});

  /// Get Address From LatLng
  Future<String> getAddressFromLatLng({required LatLng coordinates});
}
