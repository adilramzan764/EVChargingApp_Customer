
class GeneralModel {
  final String? message;
  final String? error;

  GeneralModel({this.message, this.error});

  factory GeneralModel.fromJson(Map<String, dynamic> json) {
    return GeneralModel(
      message: json['message'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    if (error != null) {
      return {
        'error': error,
      };
    } else if (message != null) {
      return {
        'message': message,
      };
    } else {
      throw Exception("GeneralModel should have either 'message' or 'error'.");
    }
  }
}
