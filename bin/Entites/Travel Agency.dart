import '../Data/Repositry.dart';
import 'Trip.dart';

class Travel_Agency {
  //====================== Task Functions
  addTrip(
    int id,
    int passengerLimit,
    double ticketPrice,
    String location,
    DateTime date,
  ) {
    Trip trip = new Trip(
      id: id,
      date: date,
      passengerLimit: passengerLimit,
      location: location,
      ticketPrice: ticketPrice,
    );
    _printTripData(trip);
    orderdTrips.add(date);
    dTrips.addAll({date: trip});
    iTrips.addAll({id: trip});
    pTrip.addAll({ticketPrice: trip});
    trips.add(trip);
  }

  deleteTrip(int id) {
    if (iTrips[id] == null)
      print("The trip is not found");
    else {
      dTrips.remove(iTrips[id].date);
      orderdTrips.remove(iTrips[id].date);
      pTrip.remove(iTrips[id].ticketPrice);
      trips.remove(iTrips[id]);
      iTrips.remove(id);
      print("\nThe trip has been deleted");
    }
  }

  viewTrips() {
    if (orderdTrips.length == 0)
      print("There are no trips");
    else {
      orderdTrips.sort((a, b) => b.compareTo(a));
      for (int x = 0; x < orderdTrips.length; x++) {
        _printTripData(dTrips[orderdTrips[x]]);
      }
    }
  }

  reserve(int passengers, int id) {
    if (iTrips[id].passengerLimit == iTrips[id].passengerOn)
      print("The number of passengers are compeleted");
    else if ((iTrips[id].passengerLimit - iTrips[id].passengerOn) < passengers)
      print(
        "It is just ${iTrips[id].passengerLimit - iTrips[id].passengerOn} tickets you can't reserve for $passengers tickets",
      );
    else {
      if (iTrips[id] == null)
        print("The trip is not found");
      else {
        iTrips[id].reverse(passengers: passengers);
        allTripsPassenger += passengers;
        print("You reserved successfully");
      }
    }
  }

  editTrip(int id, int key, var val) => iTrips[id].changeValue(key, val);

  searchTrip(double price) {
    if (pTrip[price] == null)
      print("the trip is not found");
    else
      _printTripData(pTrip[price]);
  }

  discount(int id) {
    if (iTrips[id] == null)
      print("The trip is not found");
    else {
      if (iTrips[id].isDiscounted)
        print("the trip is discounted before");
      else if (iTrips[id].ticketPrice >= 10000) {
        double before = iTrips[id].ticketPrice;
        iTrips[id].discountTrip();
        print(
            "The ticket price before : $before\nThe ticket price after : ${iTrips[id].ticketPrice}\n\n");
        _printTripData(iTrips[id]);
      } else
        print("the Trip price is lower than 10000\$");
    }
  }

  latestTrips() {
    if (trips.length == 0)
      print("There are no trips");
    else {
      int check = 0;
      for (int x = trips.length - 1; x >= 0; x--) {
        check++;
        _printTripData(trips[x]);
        if (check >= 10) break;
      }
    }
  }

  viewPassenger() {
    if (orderdTrips.length == 0)
      print("There are no trips");
    else {
      print("Passenger in all Trips : $allTripsPassenger\n");
      orderdTrips.sort((a, b) => b.compareTo(a));
      for (int x = 0; x < orderdTrips.length; x++) {
        print(
            "The Trip Id : ${dTrips[orderdTrips[x]].id}\tThe Passenger on Trip : ${dTrips[orderdTrips[x]].passengerOn}\n");
      }
    }
  }
  //====================== End

  //====================== Private Functions
  _printTripData(Trip trip) {
    print("\n\nId : ${trip.id}\n" +
        "Passenge Limit : ${trip.passengerLimit}\n" +
        "Passenger on trip : ${trip.passengerOn}\n" +
        "Ticket Price : ${trip.ticketPrice}\n" +
        "Location : ${trip.location}\n" +
        "Date : ${trip.date}\n");
  }
  //====================== End
}
