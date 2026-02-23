import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/data/repo/character_repository.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  late List<Characters> characters;

  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  List<dynamic> getAllCharacters() {
    characterRepository.getAllCharacters().then((Characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
//