import 'dart:io';

import '../Data/Repositry.dart';

class Helper {
  Map add_Data() {
    stdout.write("Enter the Id : ");
    int id = int.parse(stdin.readLineSync());
    stdout.write("Enter the Passenger Limit : ");
    int passengerLimit = int.parse(stdin.readLineSync());
    stdout.write("Enter the Location : ");
    String location = stdin.readLineSync();
    stdout.write("Enter the Ticket Price : ");
    double ticketPrice = double.parse(stdin.readLineSync());
    return {
      "id": id,
      "passenegerLimit": passengerLimit,
      "location": location,
      "ticketPrice": ticketPrice
    };
  }

  Map edit_Data() {

    stdout.write("Enter the id of the trip you want to edit : ");
    int id = int.parse(stdin.readLineSync());
    if(iTrips[id] == null) {
      print("The trip is not found");
      return null;
    }
      else {
      print("\n- For changing the id enter (Id)\n\n" +
          "- For changing the passenger limit enter (Passenger Limit)\n\n" +
          "- For changing the Passenger on trip enter (Passenger On)\n\n" +
          "- For changing the Ticket Price enter (Ticket Price)\n\n" +
          "- For changing the location enter (Location)\n\n" +
          "- For changing the date enter (Date)\n\n" +
          "\t\t====================\n");
      stdout.write("Enter the detail you want to change : ");
      String key = stdin.readLineSync();
      stdout.write("Enter the value : ");
      var val;
      if (key == "Location") {
        val = stdin.readLineSync();
      } else if (key == "Date")
        val = DateTime.parse(stdin.readLineSync());
      else if (key == "Ticket Price")
        val = double.parse(stdin.readLineSync());
      else
        val = int.parse(stdin.readLineSync());
      return {"id": id, "key": key, "val": val};
    }
  }
}
