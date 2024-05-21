import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:okoa/di/di.dart';
import 'package:okoa/features/feature_track/domain/repository/track_repository.dart';

class TrackRepositoryImpl extends TrackRepository {
  final location = locator.get<Location>();

  Future<bool> _checkLocationServiceEnabled() async =>
      await location.serviceEnabled();

  /// Request Location
  @override
  Future<void> requestLocationService() async {
    final serviceEnabled = await _checkLocationServiceEnabled();

    if (serviceEnabled) {
      await location.requestService();
    }
  }

  /// Listen to current location
  @override
  void listenToCurrentLocation(
          {required Function(LocationData locationData) onLocationChanged}) =>
      location.onLocationChanged.listen(onLocationChanged);

  /// Get Address from LatLng
  @override
  Future<String> getAddressFromLatLng({required LatLng coordinates}) async {
    try {
      final List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
              coordinates.latitude, coordinates.longitude);

      //  get first place
      final place = placemarks[0];

      return '${place.name} - ${place.subLocality} ${place.locality}, ${place.country}';
    } catch (error) {
      throw Exception(error);
    }
  }
}
