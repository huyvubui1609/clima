import 'package:clima/model/location.dart';
import 'package:clima/utilities/constants.dart';

import 'networking.dart';

class WeatherModel {
  Networking networking;

  Future<dynamic> getLocationWeather() async {
    Location _location = new Location();
    await _location.getLocation();

    var url =
        '$kOpenWeatherMapURL?lat=${_location.latitude}&lon=${_location.longitude}&appid=$kAPIKeys&units=metric';

    networking = Networking(url: url);

    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$kOpenWeatherMapURL?q=$cityName&appid=$kAPIKeys&units=metric';

    networking = Networking(url: url);
    var weatherData = await networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
