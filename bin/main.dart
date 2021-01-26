import 'dart:io';

import 'Entites/Travel Agency.dart';
import 'Models/Helper.dart';

void main() {
  print(
    "\t\tWelcome\n\n" +
        "The operations : \n\n" +
        "For adding a new trip press (1).\n\n" +
        "For changing the detils of the trip press (2).\n\n" +
        "For deleting a trip press (3).\n\n" +
        "For showing all trips with details press (4).\n\n" +
        "For searching for details of a trip press(5).\n\n" +
        "For reseving a tickets in a trip press(6).\n\n" +
        "For discounting a trip press (7).\n\n" +
        "For displaying the latest 10 trips press (8).\n\n" +
        "For displaying the number of all passeneger in all trips and each trip individually press (9).\n\n" +
        "====================================================================================================\n",
  );
  program();
}

void program() {
  Travel_Agency travel_agency = Travel_Agency();
  Helper helper = new Helper();
  stdout.write("enter the operation you want : ");
  int op = int.parse(stdin.readLineSync());
  print("");
  switch (op) {
    //===========================================

    case 1:
      Map map = helper.add_Data();
      travel_agency.addTrip(
        map["id"],
        map["passenegerLimit"],
        map["ticketPrice"],
        map["location"],
        DateTime.now(),
      );
      break;

    //===========================================

    case 2:
      Map map = helper.edit_Data();
      if (map != null)
        travel_agency.editTrip(map["id"], map["key"], map["val"]);
      break;

    //===========================================

    case 3:
      stdout.write("Enter the id of the trip you want to delete : ");
      int id = int.parse(stdin.readLineSync());
      travel_agency.deleteTrip(id);
      break;

    //===========================================

    case 4:
      travel_agency.viewTrips();
      break;

    //===========================================

    case 5:
      stdout.write("Enter the price of the trip you want to find : ");
      double price = double.parse(stdin.readLineSync());
      travel_agency.searchTrip(price);
      break;

    //===========================================

    case 6:
      stdout.write("Enter the id of the trip : ");
      int id = int.parse(stdin.readLineSync());
      stdout.write("Enter the number of the tickets you want to reserve : ");
      int passengers = int.parse(stdin.readLineSync());
      travel_agency.reserve(passengers, id);
      break;

    //===========================================

    case 7:
      stdout.write("Enter the id of trip : ");
      int id = int.parse(stdin.readLineSync());
      travel_agency.discount(id);
      break;

    //===========================================

    case 8:
      travel_agency.latestTrips();
      break;

    //===========================================

    case 9:
      travel_agency.viewPassenger();
      break;

    //===========================================

    default:
      break;
  }

  close();
}

void close() {
  stdout.write(
      "\nIf you want to close the program enter (yes) and (no) if you don't : ");
  String check = stdin.readLineSync();
  if (check == "no")
    program();
  else if (check != "yes") {
    print("the input is invalid try again.");
    close();
  }
}
