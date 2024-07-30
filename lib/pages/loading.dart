import 'package:flutter/material.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setuptime() async {
    WorldTime instance = WorldTime(
        flag: ' Berlin.png', url: 'Europe/Berlin', location: 'Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
    //print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setuptime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50),
      child: Text('loading'),
    ));
  }
}
