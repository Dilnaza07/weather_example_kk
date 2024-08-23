import 'package:flutter/material.dart';
import 'package:weather_example_kk/utilities/forecast_util.dart';

import '../models/weather_horecast_daily.dart';

class ForecastCard extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  const ForecastCard({super.key, required this.snapshot, required this.index});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var dayOfWeek = '';
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
    var fullDate = Util.getFormattedDate(date);
    dayOfWeek = fullDate.split(',')[0];

    var tempMin = forecastList[index].temp?.min?.toStringAsFixed(0);

    var icon = forecastList[index].getIconUrl();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              dayOfWeek,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        '$tempMin °C',
                        style: TextStyle(fontSize: 27, color: Colors.white),
                      ),
                    ),
                    Image.network(icon, scale: 0.7,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
