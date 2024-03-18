class StationwithChargerType_Model {
   String id;
   String stationId;
   String location; // Add this field if it's part of your data
   String spotNumber;
   String spotName;
   String status;
   List<BookingInfo> bookingInfo;
   String createdAt;
   String updatedAt;

   StationwithChargerType_Model({
    required this.id,
    required this.stationId,
    required this.location,
    required this.spotNumber,
    required this.spotName,
    required this.status,
    required this.bookingInfo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StationwithChargerType_Model.fromJson(Map<String, dynamic> json) {
    return StationwithChargerType_Model(
      id: json['_id'],
      stationId: json['station'],
      location: json['location'] ?? '', // Add this field if it's part of your data
      spotNumber: json['spotNumber'],
      spotName: json['spotName'],
      status: json['status'],
      bookingInfo: List<BookingInfo>.from(
        json['bookingInfo'].map((info) => BookingInfo.fromJson(info)),
      ),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class BookingInfo {
  final String stationId;
  final String status;
  final String buyerId;
  final String buyerName;
  final String buyerPhone;
  final String chargerType;
  final String carName;
  final String startedAt;
  final String chargingPrice;
  final String parkingPrice;
  final String duration;
  final String units;
  final String id;
  final String createdAt;
  final String updatedAt;

  BookingInfo({
    required this.stationId,
    required this.status,
    required this.buyerId,
    required this.buyerName,
    required this.buyerPhone,
    required this.chargerType,
    required this.carName,
    required this.startedAt,
    required this.chargingPrice,
    required this.parkingPrice,
    required this.duration,
    required this.units,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingInfo.fromJson(Map<String, dynamic> json) {
    return BookingInfo(
      stationId: json['stationId'] ?? '',
      status: json['status'] ?? '',
      buyerId: json['buyerId'] ?? '',
      buyerName: json['buyerName'] ?? '',
      buyerPhone: json['buyerPhone'] ?? '',
      chargerType: json['chargerType'] ?? '',
      carName: json['carName'] ?? '',
      startedAt: json['startedAt'] ?? '',
      chargingPrice: json['chargingPrice'] ?? '',
      parkingPrice: json['parkingPrice'] ?? '',
      duration: json['duration'] ?? '',
      units: json['units'] ?? '',
      id: json['_id'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}



