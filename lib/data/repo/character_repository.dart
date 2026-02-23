import '../api_server/wep_servcses.dart';

class CharacterRepository {
  final CharacterService characterService;

  CharacterRepository(this.characterService);

  Future<List<dynamic>> getAllCharacters() async {
    final character = await characterService.getAllCharacters();
    return character.map((character) => character.fromJson(character)).toList();
  }
}
