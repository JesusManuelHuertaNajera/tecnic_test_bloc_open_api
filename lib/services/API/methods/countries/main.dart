import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/API/main.dart';

class CountriesEndpoints {
  static Future<List<CountryModel>> getSearchCountryByName(
      {required String countryName}) async {
    List<CountryModel> movieList = [];
    try {
      ApiMethod api = ApiMethod();
      //get specific information on the response
      Map<String, String> queryParams = {
        'fields': 'name,capital,currencies,flags',
      };
      http.Response response = await api.apiGet(
          request: "name/$countryName", queryParams: queryParams);
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      for (var movies in responseData ?? []) {
        CountryModel toSave = CountryModel.fromJson(movies);
        movieList.add(toSave);
      }

      return movieList;
    } catch (error) {
      return movieList;
    }
  }

  static Future<List<CountryModel>> getCountries() async {
    List<CountryModel> movieList = [];
    try {
      ApiMethod api = ApiMethod();
      //get specific information on the response

      Map<String, String> queryParams = {
        'fields': 'name,capital,currencies,flags',
      };
      http.Response response =
          await api.apiGet(request: "all", queryParams: queryParams);
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      for (var movies in responseData ?? []) {
        CountryModel toSave = CountryModel.fromJson(movies);
        movieList.add(toSave);
      }

      return movieList;
    } catch (error) {
      return movieList;
    }
  }
}
