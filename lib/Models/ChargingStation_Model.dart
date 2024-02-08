class ChargingStation {
  String id;
  String serviceHours;
  String numberOfChargingSpots;
  List<String> namesOfChargingSpots;
  List<dynamic> chargingSpots;
  String perHourPrice;
  String parkingPrice;
  List<String> amenities;
  String createdAt;
  String updatedAt;
  int v;
  String location;

  ChargingStation({
    required this.id,
    required this.serviceHours,
    required this.numberOfChargingSpots,
    required this.namesOfChargingSpots,
    required this.chargingSpots,
    required this.perHourPrice,
    required this.parkingPrice,
    required this.amenities,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.location,
  });

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
      id: json['_id'],
      serviceHours: json['serviceHours'],
      numberOfChargingSpots: json['numberOfChargingSpots'],
      namesOfChargingSpots: List<String>.from(json['namesOfChargingSpots']),
      chargingSpots: json['chargingSpots'],
      perHourPrice: json['perHourPrice'],
      parkingPrice: json['ParkingPrice'],
      amenities: List<String>.from(json['amenities']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      location: json['location'],
    );
  }
}
