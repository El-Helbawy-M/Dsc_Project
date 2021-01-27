import 'dart:io';

import '../Data/Repositry.dart';
import '../Entites/Travel Agency.dart';

class Helper {
  void add_Data() {
    stdout.write("Enter the Id : ");
    int id = int.parse(stdin.readLineSync());
    stdout.write("Enter the Passenger Limit : ");
    int passengerLimit = int.parse(stdin.readLineSync());
    stdout.write("Enter the Location : ");
    String location = stdin.readLineSync();
    stdout.write("Enter the Ticket Price : ");
    double ticketPrice = double.parse(stdin.readLineSync());
    stdout.write("Enter the year : ");
    int year = int.parse(stdin.readLineSync());
    stdout.write("Enter the month : ");
    int month = int.parse(stdin.readLineSync());
    stdout.write("Enter the day : ");
    int day = int.parse(stdin.readLineSync());
    Travel_Agency().addTrip(
      id,
      passengerLimit,
      ticketPrice,
      location,
      DateTime(year, month, day),
    );
  }

  void edit_Data() {
    stdout.write("Enter the id of the trip you want to edit : ");
    int id = int.parse(stdin.readLineSync());
    if (iTrips[id] == null) {
      print("The trip is not found");
      return null;
    } else {
      print("\n(1) For changing the id\n\n" +
          "(2) For changing the passenger limit\n\n" +
          "(3) For changing the Passenger on trip\n\n" +
          "(4) For changing the Ticket Price\n\n" +
          "(5) For changing the location\n\n" +
          "(6) For changing the date\n\n" +
          "\t\t====================\n");
      stdout.write("Enter the number : ");
      int key = int.parse(stdin.readLineSync());
      stdout.write("Enter the value : ");
      var val;
      if (key == 5) {
        val = stdin.readLineSync();
      } else if (key == 6) {
        int year = int.parse(stdin.readLineSync());
        stdout.write("Enter the month : ");
        int month = int.parse(stdin.readLineSync());
        stdout.write("Enter the day : ");
        int day = int.parse(stdin.readLineSync());
        val = DateTime(year, month, day);
      } else if (key == 4)
        val = double.parse(stdin.readLineSync());
      else
        val = int.parse(stdin.readLineSync());
      Travel_Agency().editTrip(id, key, val);
    }
  }
}
