import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:world_time/pages/Location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  //Object? parameters;

  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = (data?.isEmpty ?? true)
        ? ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>
        : data;

    // final parameters

    // Map data = jsonDecode(jsonEncode(parameters));
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              SizedBox(
                width: 135,
              ),
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
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
                  icon: Icon(Icons.add_circle_outline,
                      size: 30, color: Colors.green),
                  label: Text('Edit Location',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
            ],
          ),
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
        body: Column(
          children: <Widget>[
            SizedBox(height: 190),

            Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 9, // Border width
                  ),
                ),
                child: CircleAvatar(
                  radius: 160, // Adjust radius to fit within the border
                  backgroundImage:
                      AssetImage('assets/${data['flag']}'), // Your image asset
                ),
              ),
            ),

            // CircleAvatar(
            //   backgroundImage: AssetImage('assets/${data['flag']}'),
            //   radius: 90,
            //   foregroundColor: Colors.black,
            //   backgroundColor: Colors.black,
            // ),

            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              data['time'],
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            //Icon(Icons.access_time_outlined)
          ],
        ));
  }
}
