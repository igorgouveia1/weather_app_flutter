import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

IconData getWeatherIcon(String description) {
  if (description.toLowerCase().contains('clear sky')) {
    return MdiIcons.weatherSunny;
  } else if (description.toLowerCase().contains('rain')) {
    return MdiIcons.weatherRainy;
  } else if (description.toLowerCase().contains('snow')) {
    return MdiIcons.weatherSnowy;
  } else if (description.toLowerCase().contains('clouds')) {
    return MdiIcons.weatherCloudy;
  } else {
    return MdiIcons.weatherSunny;
  }
}
