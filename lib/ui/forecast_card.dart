import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_forecast_model.dart';
import 'package:weather_app/util/convert_icon.dart';
import 'package:weather_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Saturday,Dec 14,2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(dayOfWeek),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            // If it doesn't show (Font awesome icons are not showing)

            /*
                Please try:

                  Stopping the app
                  Running flutter clean in your app directory
                  Deleting the app from your simulator / emulator / device
                  Rebuild & Deploy the app.

                 */
            //source: https://github.com/brianegan/font_awesome_flutter/issues/28#issuecomment-460109786
            child: getWeatherIcon(
                weatherDescription: forecastList[index].weather[0].main,
                color: Colors.blueAccent,
                size: 40),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                        "${forecastList[index].temp.min.toStringAsFixed(0)} °C"),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 10,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].temp.max.toStringAsFixed(0)} °C"),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.white,
                      size: 10,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Hum:${forecastList[index].humidity.toStringAsFixed(0)} %"),
 //                    Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
  //                    size: 12,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Win:${forecastList[index].speed.toStringAsFixed(1)} Km/h"),
 //                    Icon(FontAwesomeIcons.wind, color: Colors.white,
  //                     size: 12,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ],
  );
}
