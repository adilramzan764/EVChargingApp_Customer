class SendCodeToMail_Model {
  final String message;

  SendCodeToMail_Model({required this.message});

  factory SendCodeToMail_Model.fromJson(Map<String, dynamic> json) {
    return SendCodeToMail_Model(message: json['message']);
  }
}
