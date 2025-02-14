import 'package:country_info_app/Models/country_model.dart';
import 'package:country_info_app/Views/country_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryTile extends StatelessWidget {
  const CountryTile({
    super.key,
    required this.country,
  });

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 40.h,
        width: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(country.flag), fit: BoxFit.cover)),
      ),
      title: Text(country.name, style: TextStyle(fontSize: 18.sp)),
      subtitle: Text(country.capital),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryDetailsScreen(country: country),
          ),
        );
      },
    );
  }
}
