
class Trip {
  Trip({
    int id,
    int passengerLimit,
    double ticketPrice,
    String location,
    DateTime date,
  }) {
    editTrip(id, passengerLimit, ticketPrice, location, date);
  }

  //=========================== Varibales
  int _id, _passengerLimit, _passengerOn = 0;
  double _ticketPrice;
  String _location;
  DateTime _date;
  bool _discounted = false;
  //=========================== End

  //=========================== Getters
  get id => this._id;
  get passengerLimit => this._passengerLimit;
  get passengerOn => this._passengerOn;
  get ticketPrice => this._ticketPrice;
  get location => this._location;
  get date => this._date;
  get isDiscounted => this._discounted;
  //=========================== End

  //=========================== Functions

  editTrip(
    int id,
    int passengerLimit,
    double ticketPrice,
    String location,
    DateTime date,
  ) {
    this._id = id;
    this._passengerLimit = passengerLimit;
    this._ticketPrice = ticketPrice;
    this._location = location;
    this._date = date;
  }

  reverse({int passengers}) {
    _passengerOn += passengers;
  }

  discountTrip() {
    _discounted = true;
    _ticketPrice -= _ticketPrice * .2;
    print("the trip has been discounted");
  }

  changeValue(String key, var val) {
    switch (key) {
      case "Id":
        _id = val;
        break;

      case "Passenger Limit":
        _passengerLimit = val;
        break;

      case "Ticket Price":
        _ticketPrice = val;
        break;

      case "Location":
        _location = val;
        break;

      case "Date":
        _date = val;
        break;

      case "Passenger On":
        _passengerOn = val;
        break;
      default:
        break;
    }
  }
  //=========================== End
}
