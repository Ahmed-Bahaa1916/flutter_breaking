import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/bussines_logic/cubit/character_cubit.dart';
import 'package:flutter_breaking/data/repo/character_repository.dart';
import 'package:flutter_breaking/presentaion/screens/details_screen.dart';
import 'package:flutter_breaking/presentaion/screens/home_screen.dart';

import 'data/api_server/wep_servcses.dart';

class AppRoute {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;

  AppRoute() {
    characterRepository = CharacterRepository(CharacterService());
    characterCubit = CharacterCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case (HomeScreen):
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharacterCubit(characterRepository),
            child: HomeScreen(),
          ),
        );
      case (DetailsScreen):
        return MaterialPageRoute(builder: (_) => DetailsScreen());
    }
    return null;
  }
}
