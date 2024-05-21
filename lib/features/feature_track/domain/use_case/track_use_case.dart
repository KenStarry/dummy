import 'package:okoa/features/feature_track/domain/use_case/get_address_from_lat_lng.dart';
import 'package:okoa/features/feature_track/domain/use_case/listen_to_current_location.dart';
import 'package:okoa/features/feature_track/domain/use_case/request_location_service.dart';

class TrackUseCase {
  final RequestLocationService requestLocationService;
  final ListenToCurrentLocation listenToCurrentLocation;
  final GetAddressFromLatLng getAddressFromLatLng;

  TrackUseCase(
      {required this.requestLocationService,
      required this.listenToCurrentLocation,
      required this.getAddressFromLatLng});
}
