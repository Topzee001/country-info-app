// import 'dart:convert';
// import 'package:country_info_app/Core/utils/constants/url.dart';
// import 'package:country_info_app/Models/country_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CountryProvider with ChangeNotifier {
//   List<CountryModel> _countries = [];
//   List<CountryModel> _filteredCountries = [];
//   bool _isLoading = false;

//   List<CountryModel> get countries => _filteredCountries;
//   bool get isLoading => _isLoading;

//   Future<void> fetchCountries() async {
//     _isLoading = true;
//     notifyListeners();

//     final url = Uri.parse(AppUrl.baseUrl);

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         _countries = data.map((json) => CountryModel.fromJson(json)).toList();

//         _countries.sort((a, b) => a.name.compareTo(b.name));
//         _filteredCountries = _countries;
//       } else {
//         throw Exception('Failed to load countries');
//       }
//     } catch (error) {
//       print("Error: $error");
//     }

//     _isLoading = false;
//     notifyListeners();
//   }

//   void searchCountries(String query) {
//     print('searching for: $query');
//     if (query.isEmpty) {
//       _filteredCountries = _countries;
//     } else {
//       _filteredCountries = _countries
//           .where((country) =>
//               country.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }
// }

import 'package:country_info_app/Core/services/country_service.dart';
import 'package:flutter/material.dart';
import 'package:country_info_app/Models/country_model.dart';

class CountryProvider with ChangeNotifier {
  final CountryService _countryService = CountryService();

  List<CountryModel> _countries = [];
  List<CountryModel> _filteredCountries = [];
  bool _isLoading = false;

  List<CountryModel> get countries => _filteredCountries;
  bool get isLoading => _isLoading;

  Future<void> fetchCountries() async {
    _isLoading = true;
    notifyListeners();

    try {
      _countries = await _countryService.fetchCountries();
      _countries.sort((a, b) => a.name.compareTo(b.name));
      _filteredCountries = List.from(_countries);
    } catch (error) {
      print("Error: $error");
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchCountries(String query) {
    if (query.isEmpty) {
      _filteredCountries = List.from(_countries);
    } else {
      _filteredCountries = _countries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
