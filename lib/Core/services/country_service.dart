import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:country_info_app/Core/utils/constants/url.dart';
import 'package:country_info_app/Models/country_model.dart';

class CountryService {
  Future<List<CountryModel>> fetchCountries() async {
    final url = Uri.parse(AppUrl.baseUrl);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => CountryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (error) {
      throw Exception('Error fetching countries: $error');
    }
  }
}
