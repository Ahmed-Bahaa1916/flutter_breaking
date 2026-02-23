import 'package:dio/dio.dart';
import 'package:flutter_breaking/constant.dart';

class CharacterService {
  late Dio dio;

  CharacterService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio(Options as BaseOptions?);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
