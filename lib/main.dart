import 'package:flutter/material.dart';

import 'package:world_time/pages/location.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/home.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/location': (context) => Location(),
        }));
