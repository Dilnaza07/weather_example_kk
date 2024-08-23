import 'dart:convert';
import 'dart:developer';

import 'package:weather_example_kk/utilities/constants.dart';

import '../models/weather_horecast_daily.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String cityName = ''}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);

    log('reauest: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if(response.statusCode == 200){
      return WeatherForecast.fromJson(json.decode(response.body));
    }else{
      throw Exception('Error response');
    }

  }
}
