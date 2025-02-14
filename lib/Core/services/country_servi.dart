// import 'package:country_info_app/Models/country_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CountryService {
//   final String baseUrl = 'https://restcountries.com/v3.1';

//   // Get all countries
//   Future<List<Country>> getAllCountries() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/all'));

//       if (response.statusCode == 200) {
//         List<dynamic> jsonList = json.decode(response.body);
//         return jsonList.map((json) => Country.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load countries: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load countries: $e');
//     }
//   }

//   // Get country by name
//   Future<Country> getCountryByName(String name) async {
//     try {
//       final response =
//           await http.get(Uri.parse('$baseUrl/name/$name?fullText=true'));

//       if (response.statusCode == 200) {
//         List<dynamic> jsonList = json.decode(response.body);
//         if (jsonList.isNotEmpty) {
//           return Country.fromJson(jsonList.first);
//         } else {
//           throw Exception('Country not found');
//         }
//       } else {
//         throw Exception('Failed to load country: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load country: $e');
//     }
//   }

//   // Get countries by region
//   Future<List<Country>> getCountriesByRegion(String region) async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/region/$region'));

//       if (response.statusCode == 200) {
//         List<dynamic> jsonList = json.decode(response.body);
//         return jsonList.map((json) => Country.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load countries: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load countries: $e');
//     }
//   }

//   // Get country by code
//   Future<Country> getCountryByCode(String code) async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/alpha/$code'));

//       if (response.statusCode == 200) {
//         List<dynamic> jsonList = json.decode(response.body);
//         if (jsonList.isNotEmpty) {
//           return Country.fromJson(jsonList.first);
//         } else {
//           throw Exception('Country not found');
//         }
//       } else {
//         throw Exception('Failed to load country: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load country: $e');
//     }
//   }

//   // Get countries by language
//   Future<List<Country>> getCountriesByLanguage(String language) async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/lang/$language'));

//       if (response.statusCode == 200) {
//         List<dynamic> jsonList = json.decode(response.body);
//         return jsonList.map((json) => Country.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load countries: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load countries: $e');
//     }
//   }

//   // Get countries by currency
//   Future<List<Country>> getCountriesByCurrency(String currency) async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/currency/$currency'));

//       if (response.statusCode == 200) {
//         List<dynamic> jsonList = json.decode(response.body);
//         return jsonList.map((json) => Country.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load countries: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load countries: $e');
//     }
//   }
// }
