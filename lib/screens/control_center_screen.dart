import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:stupidhome/repositories/ngu_home_repository.dart';

class ControlCenterScreen extends StatefulWidget {
  @override
  _ControlCenterScreenState createState() => _ControlCenterScreenState();
}

class _ControlCenterScreenState extends State<ControlCenterScreen> {
  NguHomeRepository _repo = NguHomeRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffce4ec),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text("Stupid Home",
                    style: GoogleFonts.fredokaOne(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.lightGreen)),
              ),
              SizedBox(height: 32),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text("Stupid Values",
                      style: GoogleFonts.fredokaOne(
                          color: Colors.teal, fontSize: 22))),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: _temperatureC(),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: _humidity(),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: _lightData(),
              ),
              // TODO: add slider
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[_door(), _light()],
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: _stupidEscalator(),
              ),
              // TODO: add door button
//              Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 16),
//                child: _
//              ),
              // TODO: add light button
              SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }

  Widget _temperatureC() => StreamBuilder(
        stream: _repo.latestTemperatureValue(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _temperatureInfo(snapshot.data.snapshot.value["temperature"],
                snapshot.data.snapshot.value["temperatureF"]);
          } else {
            return CircularProgressIndicator(
              backgroundColor: Colors.lightGreen,
            );
          }
        },
      );

  Widget _temperatureInfo(temperature, temperatureF) => Row(
        children: <Widget>[
          Container(
            height: 84,
            width: 84,
            decoration: BoxDecoration(
                color: Color(0xfffce4ec),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 18,
                    color: Color(0xffe8d2d9),
                    offset: Offset(
                      9,
                      9,
                    ),
                  ),
                  BoxShadow(
                    blurRadius: 18,
                    color: Color(0xfffff6ff),
                    offset: Offset(
                      -9,
                      -9,
                    ),
                  ),
                ],
                gradient: null,
                borderRadius: BorderRadius.all(Radius.circular(
                  38,
                ))),
            child: Icon(FontAwesomeIcons.thermometerEmpty,
                size: 32, color: _getIconColor(temperature)),
          ),
          SizedBox(width: 32),
          Text("Temp $temperature °C",
              style: GoogleFonts.fredokaOne(
                  color: _getIconColor(temperature),
                  fontSize: 24,
                  fontWeight: FontWeight.normal))
        ],
      );

  Color _getIconColor(temperature) {
    if (temperature < 20) {
      return Colors.white;
    } else if (temperature < 25) {
      return Colors.blue;
    } else if (temperature < 30) {
      return Colors.green;
    } else if (temperature < 35) {
      return Colors.orange;
    } else if (temperature < 40) {
      return Colors.deepOrange;
    } else {
      return Colors.black;
    }
  }

  Widget _humidity() => StreamBuilder(
        stream: _repo.latestHumidityStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return humidityInfo(snapshot.data.snapshot.value["humidity"]);
          } else {
            return CircularProgressIndicator(
              backgroundColor: Colors.lightGreen,
            );
          }
        },
      );

  Widget humidityInfo(int humidity) {
    return Row(
      children: <Widget>[
        Container(
          height: 84,
          width: 84,
          decoration: BoxDecoration(
              color: Color(0xfffce4ec),
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  color: Color(0xffe8d2d9),
                  offset: Offset(
                    9,
                    9,
                  ),
                ),
                BoxShadow(
                  blurRadius: 18,
                  color: Color(0xfffff6ff),
                  offset: Offset(
                    -9,
                    -9,
                  ),
                ),
              ],
              gradient: null,
              borderRadius: BorderRadius.all(Radius.circular(
                38,
              ))),
          child:
              Icon(FontAwesomeIcons.water, size: 32, color: Colors.lightBlue),
        ),
        SizedBox(width: 32),
        Text("Humidity $humidity %",
            style: GoogleFonts.fredokaOne(
                color: Colors.lightBlue,
                fontSize: 24,
                fontWeight: FontWeight.normal))
      ],
    );
  }

  Widget _stupidEscalator() {
    return StreamBuilder(
      stream: _repo.escalatorStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var escalator = snapshot.data.snapshot.value;
          return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xfffce4ec),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      color: Color(0xffbdabb1),
                      offset: Offset(
                        7,
                        7,
                      ),
                    ),
                    BoxShadow(
                      blurRadius: 14,
                      color: Color(0xffffffff),
                      offset: Offset(
                        -7,
                        -7,
                      ),
                    ),
                  ],
                  gradient: null,
                  borderRadius: BorderRadius.all(Radius.circular(
                    16,
                  ))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Stupid Escalator",
                        style: GoogleFonts.fredokaOne(
                          fontSize: 20,
                          color: Colors.green,
                        )),
                    SizedBox(
                        height: 64,
                        child: Transform(
                          transform: Matrix4.rotationY(math.pi),
                          alignment: Alignment.center,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Colors.green[700],
                                activeTrackColor: Colors.green[100],
                                trackShape: RoundedRectSliderTrackShape(),
                                trackHeight: 4.0,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12.0),
                                thumbColor: Colors.greenAccent,
                                overlayColor: Colors.green.withAlpha(32),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 28.0),
                                tickMarkShape: RoundSliderTickMarkShape(),
                                activeTickMarkColor: Colors.green[700],
                                inactiveTickMarkColor: Colors.green[100],
                                valueIndicatorShape:
                                    PaddleSliderValueIndicatorShape(),
                                valueIndicatorColor: Colors.greenAccent,
                                valueIndicatorTextStyle:
                                    GoogleFonts.fredokaOne(color: Colors.white)),
                            child: Slider(
                              max: 5,
                              min: 1,
                              divisions: 4,
                              onChanged: (value) {
                                _repo.changeEscalatorSpeed(value.toInt());
                              },
                              value: (escalator["speed"] as int).toDouble(),
                            ),
                          ),
                        )),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 84,
                          width: 84,
                          decoration: BoxDecoration(
                              color: Color(0xfffce4ec),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 18,
                                  color: Color(0xffe8d2d9),
                                  offset: Offset(
                                    9,
                                    9,
                                  ),
                                ),
                                BoxShadow(
                                  blurRadius: 18,
                                  color: Color(0xfffff6ff),
                                  offset: Offset(
                                    -9,
                                    -9,
                                  ),
                                ),
                              ],
                              gradient: null,
                              borderRadius: BorderRadius.all(Radius.circular(
                                38,
                              ))),
                          child: IconButton(
                              onPressed: () => _repo.changeEscalatorMode(
                                  (escalator["currentStatus"] as int) == 1
                                      ? 0
                                      : 1),
                              icon: Icon(
                                  (escalator["currentStatus"] as int) == 1
                                      ? FontAwesomeIcons.toggleOn
                                      : FontAwesomeIcons.toggleOff,
                                  size: 32,
                                  color: Colors.green)),
                        ),
                        SizedBox(width: 32),
                        Container(
                          height: 83,
                          width: 83,
                          decoration: BoxDecoration(
                              color: Color(0xfffce4eb),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 17,
                                  color: Color(0xffe8d2d8),
                                  offset: Offset(
                                    8,
                                    8,
                                  ),
                                ),
                                BoxShadow(
                                  blurRadius: 17,
                                  color: Color(0xfffff6fe),
                                  offset: Offset(
                                    -10,
                                    -10,
                                  ),
                                ),
                              ],
                              gradient: null,
                              borderRadius: BorderRadius.all(Radius.circular(
                                37,
                              ))),
                          child: IconButton(
                              onPressed: () =>
                                  _repo.changeEscalatorClockwiseMode(
                                      (escalator["clockwise"] as int) == 1
                                          ? 0
                                          : 1),
                              icon: Icon(
                                  (escalator["clockwise"] as int) == 1
                                      ? FontAwesomeIcons.arrowUp
                                      : FontAwesomeIcons.arrowDown,
                                  size: 32,
                                  color: Colors.green)),
                        )
                      ],
                    ),
                  ],
                ),
              ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _lightData() {
    return StreamBuilder(
      stream: _repo.latestLightDataStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _lightDataInfo(snapshot.data.snapshot.value["light"]);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _lightDataInfo(int lightLevel) {
    return Row(
      children: <Widget>[
        Container(
          height: 84,
          width: 84,
          decoration: BoxDecoration(
              color: Color(0xfffce4ec),
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  color: Color(0xffe8d2d9),
                  offset: Offset(
                    9,
                    9,
                  ),
                ),
                BoxShadow(
                  blurRadius: 18,
                  color: Color(0xfffff6ff),
                  offset: Offset(
                    -9,
                    -9,
                  ),
                ),
              ],
              gradient: null,
              borderRadius: BorderRadius.all(Radius.circular(
                38,
              ))),
          child: Icon(FontAwesomeIcons.sun, size: 32, color: Colors.amber),
        ),
        SizedBox(width: 32),
        Text("Light level $lightLevel",
            style: GoogleFonts.fredokaOne(
                color: Colors.amber,
                fontSize: 24,
                fontWeight: FontWeight.normal))
      ],
    );
  }

  Widget _door() {
    return StreamBuilder(
      stream: _repo.doorStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int mode = snapshot.data.snapshot.value as int;
          return Column(
            children: <Widget>[
              Text("Stupid Door",
                  style: GoogleFonts.fredokaOne(
                      fontSize: 20, color: Colors.purple)),
              SizedBox(height: 20),
              Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                    color: Color(0xfffce4ec),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Color(0xffd6c2c9),
                        offset: Offset(
                          10,
                          10,
                        ),
                      ),
                      BoxShadow(
                        blurRadius: 20,
                        color: Color(0xffffffff),
                        offset: Offset(
                          -10,
                          -10,
                        ),
                      ),
                    ],
                    gradient: null,
                    borderRadius: BorderRadius.all(Radius.circular(
                      29,
                    ))),
                child: IconButton(
                  onPressed: () => _repo.changeDoorMode(mode == 0 ? 1 : 0),
                  icon: Icon(
                      mode == 0
                          ? FontAwesomeIcons.doorOpen
                          : FontAwesomeIcons.doorClosed,
                      color: Colors.purple),
                ),
              )
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _light() {
    return StreamBuilder(
      stream: _repo.lightStateStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var lightMode = snapshot.data.snapshot.value;
          return Column(
            children: <Widget>[
              Text("Stupid Light",
                  style:
                      GoogleFonts.fredokaOne(fontSize: 20, color: Colors.red)),
              SizedBox(height: 20),
              Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                    color: Color(0xfffce4ec),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Color(0xffd6c2c9),
                        offset: Offset(
                          10,
                          10,
                        ),
                      ),
                      BoxShadow(
                        blurRadius: 20,
                        color: Color(0xffffffff),
                        offset: Offset(
                          -10,
                          -10,
                        ),
                      ),
                    ],
                    gradient: null,
                    borderRadius: BorderRadius.all(Radius.circular(
                      29,
                    ))),
                child: IconButton(
                  onPressed: () =>
                      _repo.changeLightMode(lightMode == 1 ? 0 : 1),
                  icon: Icon(
                      lightMode == 1
                          ? Icons.wb_incandescent
                          : Icons.lightbulb_outline,
                      color: Colors.red),
                ),
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

int reverseValue(int value) {
  switch(value) {
    case 5:
      return 0;
      break;
    case 4:
      return 1;
      break;
    case 3:
      return 2;
      break;
    case 2:
      return 3;
      break;
    case 1:
      return 4;
      break;
    case 0:
      return 5;
      break;
    default:
      return 0;
      break;
  }
}
