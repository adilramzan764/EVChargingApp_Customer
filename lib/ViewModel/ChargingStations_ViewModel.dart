import 'dart:convert';
import 'package:get/get.dart';
import '../ApiServices/GetAllChargingStation_Api.dart';
import '../Models/ChargingStation_Model.dart';


class ChargingStationViewModel extends GetxController {
  var chargingStations = <ChargingStation>[].obs;

  Future<void> getChargingStationData() async {
    try {
      final response = await GetAllChargingStation_Api.getChargingStationData();
      print("Stations"+ response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);

        var stationsList = responseData['Stations'] as List<dynamic>;
        chargingStations.assignAll(stationsList.map((stationData) => ChargingStation.fromJson(stationData)));
      } else {
        throw Exception('Failed to load charging station data');
      }
    } catch (e) {
      throw Exception('Failed to perform API call: $e');
    }
  }
}
