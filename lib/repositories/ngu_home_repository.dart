import 'package:firebase_database/firebase_database.dart';

class NguHomeRepository {
  final _database = FirebaseDatabase.instance.reference();

  changeLightMode(int mode) async {
    return _database.child("light").set(mode);
  }
  changeDoorMode(int mode) async {
    return _database.child("door").set(mode);
  }

  changeEscalatorSpeed(int speed) async {
    return _database.child("escalator").child("speed").set(speed);
  }

  changeEscalatorClockwiseMode(int mode) async => _database.child("escalator").child("clockwise").set(mode);
  
  changeEscalatorMode(int mode) async => _database.child("escalator").child("currentStatus").set(mode);

  Stream<Event> lightStateStream() {
    return _database.child("light").onValue;
  }
  
  Stream<Event> temperatureStream() => _database.child("temperature").onValue;

  Stream<Event> latestHumidityStream() => _database.child("humidity").onValue;

  Stream<Event> humidityStream() => _database.child("humidity").onValue;

  Stream<Event> latestTemperatureValue() => _database.child("temperature").onValue;

  Stream<Event> escalatorStream() => _database.child("escalator").onValue;

  Stream<Event> latestLightDataStream() => _database.child("lightData").onValue;
  
  Stream<Event> doorStream() => _database.child("door").onValue;
}