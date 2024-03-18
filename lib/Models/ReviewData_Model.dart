class Review_Model {
  final String id;
  final String stationId;
  final String buyerId;
  final String buyerImage;
  final String buyerName;
  final double reviewRating;
  final String reviewBody;
  final String reviewDate;

  Review_Model({
    required this.id,
    required this.stationId,
    required this.buyerId,
    required this.buyerImage,
    required this.buyerName,
    required this.reviewRating,
    required this.reviewBody,
    required this.reviewDate,
  });

  factory Review_Model.fromJson(Map<String, dynamic> json) {
    return Review_Model(
      id: json['_id'],
      stationId: json['stationId'],
      buyerId: json['buyerId'],
      buyerImage: json['buyerImage'],
      buyerName: json['buyerName'],
      reviewRating: json['reviewRating'].toDouble(),
      reviewBody: json['reviewBody'],
      reviewDate: json['reviewDate'],
    );
  }
}
