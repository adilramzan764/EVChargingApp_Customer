import 'dart:convert';
import 'package:evchargingapp/Models/StationwithChargerType_Model.dart';
import 'package:get/get.dart';
import '../ApiServices/GetAllChargingStationByChargerType_Api.dart';


class ChargingStationViewModel extends GetxController {
  var StationwithChargerType = <StationwithChargerType_Model>[].obs;

  Future<void> getChargingStationData() async {
    try {
      final response = await GetAllChargingStationByChargerType_Api.getChargingStationData();
      print("Stations"+ response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);

        var stationsList = responseData['Stations'] as List<dynamic>;
        StationwithChargerType.assignAll(stationsList.map((stationData) => StationwithChargerType_Model.fromJson(stationData)));
      } else {
        throw Exception('Failed to load charging station data');
      }
    } catch (e) {
      throw Exception('Failed to perform API call: $e');
    }
  }
}
