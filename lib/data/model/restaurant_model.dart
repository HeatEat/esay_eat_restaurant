class RestaurantModel {
  final String restaurantName;
  bool hasDetails = false;
  final String nipNumber;
  final String cityName;
  final String streetName;
  final int? buildingNumber;
  final int? premisesNumber;
  final String postCode;
  String? avatarUrl;

  RestaurantModel(
      {required this.restaurantName,
      required this.nipNumber,
      required this.cityName,
      required this.streetName,
      required this.buildingNumber,
      required this.premisesNumber,
      required this.postCode,
      required this.avatarUrl});

  bool get hasSetDetails {
    return hasDetails;
  }

  set hasSetDetails(bool value) {
    hasDetails = value;
  }

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
        restaurantName: json["restaurant_name"] ?? "",
        nipNumber: json["nip_number"] ?? "",
        cityName: json["city_name"] ?? "",
        streetName: json["street_name"] ?? "",
        buildingNumber: json["building_number"],
        premisesNumber: json["premises_number"],
        postCode: json["post_code"] ?? "",
        avatarUrl: json["avatar_url"]);
  }

  @override
  String toString() {
    return "{restaurantName: $restaurantName, nipNumber: $nipNumber, cityName: $cityName, streetName: $streetName, buildingNumber: $buildingNumber, premisesNumber: $premisesNumber, postCode: $postCode, avatarUrl: $avatarUrl}";
  }
}
