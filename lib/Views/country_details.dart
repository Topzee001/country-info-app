import 'package:country_info_app/Models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetailsScreen extends StatelessWidget {
  final CountryModel country;

  const CountryDetailsScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200.h,
                width: 380.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                        image: NetworkImage(country.flag), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 20.h),
            Text("Population: ${country.population}",
                style: TextStyle(fontSize: 18.sp)),
            Text("Capital: ${country.capital}",
                style: TextStyle(fontSize: 18.sp)),
            Text("Region: ${country.region}",
                style: TextStyle(fontSize: 18.sp)),
            Text("Currency: ${country.currency}",
                style: TextStyle(fontSize: 18.sp)),
            Text("Official language: ${country.language}",
                style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}
