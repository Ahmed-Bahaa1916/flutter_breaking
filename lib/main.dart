import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/observer.dart';

import 'app_route.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(BreakingBadApp(appRoute: AppRoute()));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({super.key, required this.appRoute});

  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
