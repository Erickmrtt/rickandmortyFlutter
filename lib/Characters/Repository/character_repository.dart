import 'dart:convert';

import 'package:rick_and_morty/Characters/Model/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterRepository {
  Future<List<CharacterResult>> fetchCharacters() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      final results = decode['results'] as List;
      return results
          .map<CharacterResult>((item) => CharacterResult.fromJson(item))
          .toList();
    } else {
      return Future.error(
          "Ops! An unexpected error occurred: ${response.reasonPhrase}");
    }
  }
}

class GenericModel<T> {
  factory GenericModel.fromJson(Map<String, dynamic> json, T) => T(json);
}

class AppRepository<T> {
  Future<GenericModel> getGeneriApiCall(String url, T model) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      return GenericModel.fromJson(decode, model);
    } else {
      return Future.error(
          "Ops! An unexpected error occurred: ${response.reasonPhrase}");
    }
  }

  Future<List<GenericModel>> getGenericApiCallList(String url, T model) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      return decode
          .map<GenericModel>((item) => GenericModel.fromJson(item, model))
          .toList();
    } else {
      return Future.error(
          "Ops! An unexpected error occurred: ${response.reasonPhrase}");
    }
  }

  Future<Map<String, GenericModel>> getGenericApiCallMap(
      String url, T model) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      final Map<String, GenericModel> advices = decode.map((key, value) =>
          MapEntry(key,
              GenericModel.fromJson(value as Map<String, dynamic>, model)));
      return advices;
    } else {
      return Future.error(
          "Ops! An unexpected error occurred: ${response.reasonPhrase}");
    }
  }
}
