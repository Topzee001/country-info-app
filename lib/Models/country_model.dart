class CountryModel {
  final String name;
  final String flag;
  final String region;
  final String capital;
  final int population;
  final String currency;
  final String language;
  //  final Flags flags;

  CountryModel({
    required this.name,
    required this.flag,
    required this.region,
    required this.capital,
    required this.population,
    required this.currency,
    required this.language,
    // required this.flags,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'] ?? 'Unknown',
      flag: json['flags']['png'] ?? '',
      // flags: Flags.fromJson(json["flags"]),
      region: json['region'] ?? 'Unknown',
      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : 'No Capital',
      population: json['population'] ?? 0,
      currency: json['currencies'] != null
          ? json['currencies'].values.first['name']
          : 'Unknown',
      language: json['languages'] != null
          ? json['languages'].values.first
          : 'Unknown',
    );
  }
}

/**
 from task:
 Name
State/Provinces (if available)
Flag (image) - avai
Population - avai
Capital city - avai
Current President (if available) - nan
Continent - nan
Country code - nan
 
from the UI:
population- done
region - done
capital- 
motto


official language
ethnic group
religion
government

Independence
area
currency
gdp

timezone
dateformat: dd/mm/yyy
dialing code
driving side 
 
 */