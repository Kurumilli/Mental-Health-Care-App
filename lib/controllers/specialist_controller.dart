import 'package:flutter_application_1/models/specialist_model.dart';
import 'package:flutter_application_1/services/api/specialist_api_service.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:developer';

class SpecialistController extends GetxController {
  static SpecialistController get to => Get.find();

  var isLoading = false.obs;
  var specialistList = <SpecialistModel>[].obs;
  var addressList = <Placemark>[].obs;

  final _selectedCity = 'jaipur'.obs;
  get selectedCity => _selectedCity.value;
  set selectedCity(value) => _selectedCity.value = value;

  final _lat = 0.0.obs;
  get lat => _lat.value;
  set lat(value) => _lat.value = value;

  final _long = 0.0.obs;
  get long => _long.value;
  set long(value) => _long.value = value;

  @override
  void onInit() {
    super.onInit();
    determinePosition();
    fetchSpecialists(selectedCity);
  }

  /// Updates selected city and fetches new specialists if changed.
  void updateCity(String value) {
    if (value != selectedCity) {
      selectedCity = value;
      fetchSpecialists(selectedCity);
    }
  }

  /// Fetches user's current location.
  Future<void> determinePosition() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw Exception('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      log("Error getting location: ${e.toString()}");
    }
  }

  /// Fetches address details for a specialist at the given index.
  Future<void> fetchAddress(int index) async {
    try {
      var specialist = specialistList[index];
      List<Placemark> placemarks = await placemarkFromCoordinates(
        double.parse(specialist.latitude!),
        double.parse(specialist.longitude!),
      );

      if (placemarks.isNotEmpty) {
        addressList[index] = placemarks.first; // More efficient list update
      }
    } catch (e) {
      log("Error fetching address: ${e.toString()}");
    }
  }

  /// Fetches specialists for the given city.
  Future<void> fetchSpecialists(String city) async {
    isLoading(true);
    try {
      var specialists = await SpecialistApiService.fetchSpecialists(city);
      specialistList.assignAll(specialists);
    } catch (e) {
      log("Error fetching specialists: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    // Dispose controllers if any in future
    super.onClose();
  }
}
