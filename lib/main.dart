import 'package:bloc/bloc.dart';
import 'package:calculator/size_config.dart';

import 'package:calculator/config/theme/theme.dart';
import 'package:flutter/material.dart';

import 'config/routes/routes.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  var user = CacheHelper.getData("User");
  String route;
  if (user == null) {
    route = Routes.splash;
  } else {
    route = Routes.home;
  }
  runApp(MyApp(route));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp(this.route);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute:route,
       onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
      );
  }
}
