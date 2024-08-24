import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:world_time/pages/calender.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  void initstate() {
    super.initState();
  }

//  bool isSwitched = false;

  // Color bg = Colors.white;
  @override
  Widget build(BuildContext context) {
    data = (data?.isEmpty ?? true)
        ? ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>
        : data;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white60,
          shape: CircleBorder(),
          onPressed: () async {
            dynamic result = await Navigator.pushNamed(context, '/location');
            if (result != null) {
              setState(() {
                data = {
                  'time': result['time'],
                  'location': result['location'],
                  'flag': result['flag']
                };
              });
            }
          },
          child: const Icon(Icons.add_circle_outline,
              size: 38, color: Colors.black),
        ),
        backgroundColor: Colors.white60,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: AnalogClock(
                      decoration: BoxDecoration(
                          border: Border.all(width: 8.0, color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          color: Colors.white,
                          shape: BoxShape.circle),
                      width: 15.0,
                      isLive: true,
                      hourHandColor: Colors.red,
                      minuteHandColor: Colors.black,
                      showSecondHand: true,
                      secondHandColor: Colors.blue,
                      numberColor: Colors.black,
                      showNumbers: true,
                      showAllNumbers: false,
                      textScaleFactor: 1.3,
                      showTicks: true,
                      tickColor: Colors.black,
                      showDigitalClock: true,
                      datetime: DateTime.now(),
                      useMilitaryTime: false),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child:
                          // Column(
                          //   children: [
                          Text(
                        data['time'],
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Teko'),
                      ),
                      // Switch(
                      //   onChanged: (value) {
                      //     setState(() {
                      //       bg = Colors.black;
                      //     });
                      //   },
                      //   value: bg == Colors.white,
                      // )
                      //   ],
                      // ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(0, 3))
                            ]),
                        width: 120,
                        height: 150,
                        child: Column(children: [
                          Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black, // Border color
                                  width: 9, // Border width
                                ),
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius:
                                      150, // Adjust radius to fit within the border
                                  backgroundImage: AssetImage(
                                      'assets/${data['flag']}'), // Your image asset
                                ),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data['location'],
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Teko'),
                              ),
                            ],
                          ),
                        ])),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 490,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                child: Monthly(),
              ),
            )
          ],
        )));
  }
}
