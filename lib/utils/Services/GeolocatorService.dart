import 'package:geolocator/geolocator.dart';

class GeolocationService {
  // Demander les permissions de localisation
  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions refusées de manière permanente
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions refusées de manière permanente, ne peut pas demander à nouveau
      return false;
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  // Vérifier si le service de localisation est activé
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Récupérer la position actuelle de l'utilisateur
  Future<Position?> getCurrentPosition() async {
    // Vérifier les permissions
    bool hasPermission = await _requestPermission();
    if (!hasPermission) {
      // Permissions non accordées
      return null;
    }

    // Vérifier si le service de localisation est activé
    bool serviceEnabled = await isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Service de localisation désactivé
      return null;
    }

    // Récupérer la position actuelle
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // Écouter les changements de position en temps réel
  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // Mètres avant d'émettre une nouvelle position
      ),
    );
  }

  // Ouvrir les paramètres de localisation
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }
}
