class RestaurantModel {
  final String restaurantName;
  bool hasRestaurantDetails = false;
  final String nipNumber;
  final String cityName;
  final String streetName;
  final int buildingNumber;
  final int premisesNumber;
  final String postCode;

  RestaurantModel(
      {required this.restaurantName,
      required this.nipNumber,
      required this.cityName,
      required this.streetName,
      required this.buildingNumber,
      required this.premisesNumber,
      required this.postCode});

  bool get hasSetDetails {
    return hasRestaurantDetails;
  }

  set hasSetDetails(bool value) {
    hasRestaurantDetails = value;
  }
}
