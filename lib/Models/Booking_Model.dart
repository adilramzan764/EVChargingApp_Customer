class Booking_Model {
  final String spotId;
  final String startedAt;
  final String duration;
  final String units;
  final String stationId;
  final String chargingPrice;
  final String parkingPrice;
  final String buyerId;
  final String buyerName;
  final String buyerPhone;
  final String chargerType;
  final String carName;

  Booking_Model({
    required this.spotId,
    required this.startedAt,
    required this.duration,
    required this.units,
    required this.stationId,
    required this.chargingPrice,
    required this.parkingPrice,
    required this.buyerId,
    required this.buyerName,
    required this.buyerPhone,
    required this.chargerType,
    required this.carName,
  });

  Map<String, dynamic> toMap() {
    return {
      'spotId': spotId,
      'startedAt': startedAt,
      'duration': duration,
      'units': units,
      'stationId': stationId,
      'chargingPrice': chargingPrice,
      'parkingPrice': parkingPrice,
      'buyerId': buyerId,
      'buyerName': buyerName,
      'buyerPhone': buyerPhone,
      'chargerType': chargerType,
      'carName': carName,
    };
  }

  factory Booking_Model.fromMap(Map<String, dynamic> map) {
    return Booking_Model(
      spotId: map['spotId'],
      startedAt: map['startedAt'],
      duration: map['duration'],
      units: map['units'],
      stationId: map['stationId'],
      chargingPrice: map['chargingPrice'],
      parkingPrice: map['parkingPrice'],
      buyerId: map['buyerId'],
      buyerName: map['buyerName'],
      buyerPhone: map['buyerPhone'],
      chargerType: map['chargerType'],
      carName: map['carName'],
    );
  }
}
