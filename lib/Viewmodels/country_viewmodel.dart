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
