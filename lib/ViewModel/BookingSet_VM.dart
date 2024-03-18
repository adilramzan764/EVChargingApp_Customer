import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingSet_VM extends GetxController {
  var spotname = ''.obs;

  var selectedDate=''.obs;



  var selectedYearAndMonth = ''.obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;
  var arrivalTime = '03:30 AM'.obs;
  var departureTime = '03:30 AM'.obs;
  var calendarFormat = CalendarFormat.week.obs;
  var duration = ''.obs;

  void calculateAndStoreDuration() {
    try {
      DateTime arrivalDateTime = DateFormat('hh:mm a').parse(arrivalTime.value);
      DateTime departureDateTime = DateFormat('hh:mm a').parse(departureTime.value);

      Duration result = departureDateTime.difference(arrivalDateTime);

      duration.value = '${result.inHours} h ${result.inMinutes % 60} mins';
    } catch (e) {
      print('Error parsing time: $e');
      duration.value = ''; // Handle the error, reset the duration value or provide default values
    }
  }

  void onSelectionChanged(String selectedMonth, int selectedYear) {
    selectedYearAndMonth.value = '$selectedMonth $selectedYear';
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
    selectedDate.value = DateFormat('d').format(selectedDay);
    String formattedDay = DateFormat('d').format(selectedDay);

    print("selected date:"+ selectedDate.value);
    selectedDate.value= '$selectedDate $selectedYearAndMonth';
    print("Selected date: ${selectedDate.value}");
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat.value = format;
  }

  void onArrivalTimeChanged(String hours, String minutes, String ampm) {
    arrivalTime.value = '$hours:$minutes $ampm';
    print('Arrival Time: ${arrivalTime.value}');
  }

  void onDepartureTimeChanged(String hours, String minutes, String ampm) {
    departureTime.value = '$hours:$minutes $ampm';
    print('Departure Time: ${departureTime.value}');
  }
}
