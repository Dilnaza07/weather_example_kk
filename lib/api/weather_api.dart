import 'dart:convert';
import 'dart:developer';
import 'package:weather_example_kk/utilities/constants.dart';
import 'package:weather_example_kk/utilities/location.dart';

import '../models/weather_horecast_daily.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String cityName = '', bool isCity = false}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parameters = {};

    if (isCity == true) {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
      };
      parameters = queryParameters;
    } else {
      var queryParameters = {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'cnt': '7',
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parameters = queryParameters;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    log('reauest: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
