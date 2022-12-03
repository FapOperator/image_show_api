import 'package:flutter/material.dart';
import 'package:image_show_api/model/picture_model.dart';
import 'package:image_show_api/presentation/screens/full_picture_screen.dart';
import 'package:image_show_api/presentation/screens/picture_list.dart';
import 'package:image_show_api/route/route_constants.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(
    RouteSettings setting,
  ) =>
      {
        RouteList.initial: (context) => const PictureList(),
        RouteList.fullPictureScreen: (context) =>
            FullPictureScreen(picture: setting.arguments as PictureModel),
      };
}
