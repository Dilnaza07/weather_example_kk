import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/weather_horecast_daily.dart';
import '../utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var pressure = forecastList?[0].pressure;
    var humidity = forecastList?[0].humidity;
    var wind = forecastList?[0].speed;

    if (pressure != null) {
      pressure * 0.750062;
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              pressure!.round(), 'mm Hg'),
          Util.getItem(
              FontAwesomeIcons.cloudRain, humidity != null ? humidity : 0, '%'),
          Util.getItem(
              FontAwesomeIcons.wind, (wind != null ? wind : 0).toInt(), 'm/s'),
        ],
      ),
    );
  }
}
