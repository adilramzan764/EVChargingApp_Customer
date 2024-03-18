// station_model.dart

class ChargingStation {
  final String id;
  final String serviceHours;
  final String numberOfChargingSpots;
  final String perHourPrice;
  final String parkingPrice;
  final List<String> amenities;
  final List<String> stationImages;
  final List<String> reviews;
  final String location;
  final String description;

  final String createdAt;
  final String updatedAt;

  ChargingStation({
    required this.id,
    required this.serviceHours,
    required this.numberOfChargingSpots,
    required this.perHourPrice,
    required this.parkingPrice,
    required this.amenities,
    required this.stationImages,
    required this.reviews,
    required this.location,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
      id: json['_id'],
      serviceHours: json['serviceHours'],
      numberOfChargingSpots: json['numberOfChargingSpots'],
      perHourPrice: json['perHourPrice'],
      parkingPrice: json['ParkingPrice'],
      amenities: List<String>.from(json['amenities']),
      stationImages: List<String>.from(json['stationImages']),
      reviews: List<String>.from(json['reviews']),
      location: json['location'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

// spot_model.dart

class Spot {
  final String id;
  final String station;
  final String location;
  final String spotNumber;
  final String spotName;
  final String status;
  final List<dynamic> bookingInfo;
  final String createdAt;
  final String updatedAt;

  Spot({
    required this.id,
    required this.station,
    required this.location,
    required this.spotNumber,
    required this.spotName,
    required this.status,
    required this.bookingInfo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Spot.fromJson(Map<String, dynamic> json) {
    return Spot(
      id: json['_id'],
      station: json['station'],
      location: json['location'],
      spotNumber: json['spotNumber'],
      spotName: json['spotName'],
      status: json['status'],
      bookingInfo: json['bookingInfo'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
