import 'package:flutter/material.dart';
import 'package:image_show_api/route/fade_page_route_builder.dart';
import 'package:image_show_api/route/route_constants.dart';
import 'package:image_show_api/route/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'showPictureApi',
      initialRoute: RouteList.initial,
      onGenerateRoute: (RouteSettings settings) {
        final routes = Routes.getRoutes(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return FadePageRouteBuilder<dynamic>(
          builder: builder!,
          settings: settings,
        );
      },
    );
  }
}
