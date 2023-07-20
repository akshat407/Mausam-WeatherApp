import 'dart:convert';

import 'package:http/http.dart' as http;

import 'weathermodel.dart';

class WeatherData{
  Future<Weather> getData(var latitude, var longitude) async {
    var uricall=Uri.parse('https://api.weatherapi.com/v1/current.json?key=f921e6092007482e9d2103526230907&q=$latitude,$longitude&aqi=no');

    var response= await http.get(uricall);
    var body=jsonDecode(response.body);
    return Weather.fromjson(body);


  }
}