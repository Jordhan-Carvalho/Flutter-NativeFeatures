const GOOGLE_API_KEY = 'AIzaSyCqhF6vHxLczlE_C3HwqRyyLFKjJBqGrF0';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
