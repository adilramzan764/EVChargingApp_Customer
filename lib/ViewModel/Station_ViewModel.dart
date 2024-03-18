import 'dart:convert';
import 'package:evchargingapp/ApiServices/GetChargingStationById_Api.dart';
import 'package:evchargingapp/Models/ChargingStation_Model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class Station_ViewModel extends GetxController {
  var stations = <ChargingStation>[].obs;
  var spots = <Spot>[].obs;



  Future<void> fetchChargingStationData(String station_id) async {
    try {
      final response = await GetAllChargingStationByid_Api.getChargingStationData(station_id);
      print("Stations"+ response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);

        var stationsList = responseData['Stations'] as List<dynamic>;
        stations.assignAll(stationsList.map((stationData) => ChargingStation.fromJson(stationData)));


        if (responseData.containsKey('spots')) {
          var spotsList = responseData['spots'] as List<dynamic>;
          spots.assignAll(
            spotsList.map(
                  (spotData) => Spot.fromJson(spotData),
            ),
          );
        }
      } else {
        throw Exception('Failed to load charging station data');
      }





      // if (response.statusCode == 200) {
      //   Map<String, dynamic> responseData = json.decode(response.body);
      //
      //   if (responseData.containsKey('Stations')) {
      //     var stationsList = responseData['Stations'] as List<dynamic>;
      //     stations.assignAll(
      //       stationsList.map(
      //             (stationData) => ChargingStation.fromJson(stationData),
      //       ),
      //     );
      //   }
      //
      //   if (responseData.containsKey('spots')) {
      //     var spotsList = responseData['spots'] as List<dynamic>;
      //     spots.assignAll(
      //       spotsList.map(
      //             (spotData) => Spot.fromJson(spotData),
      //       ),
      //     );
      //   }
      // } else {
      //   throw Exception('Failed to load charging station data');
      // }
    } catch (e) {
      throw Exception('Failed to perform API call: $e');
    }
  }
}
