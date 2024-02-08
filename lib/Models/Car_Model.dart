class Car {
  String id;
  String brand;
  String model;
  String trim;
  String batteryCapacity;
  String createdAt;
  String updatedAt;
  int v;

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.trim,
    required this.batteryCapacity,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['_id'],
      brand: json['brand'],
      model: json['model'],
      trim: json['trim'],
      batteryCapacity: json['batteryCapacity'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}