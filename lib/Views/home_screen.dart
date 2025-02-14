import 'package:country_info_app/Core/utils/colors.dart';
import 'package:country_info_app/Models/country_model.dart';
import 'package:country_info_app/Viewmodels/country_viewmodel.dart';
import 'package:country_info_app/Viewmodels/theme_viewmodel.dart';
import 'package:country_info_app/Views/country_details.dart';
import 'package:country_info_app/Widgets/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<CountryProvider>(context, listen: false).fetchCountries());
  }

  @override
  void dispose() {
    searchController.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
    final themeProvider = Provider.of<ThemeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: themeProvider.themeMode == ThemeMode.dark
            ? SizedBox(
                height: 24.h,
                width: 94.w,
                child: Image.asset('assets/explore_light.png'),
              )
            : SizedBox(
                height: 34.h,
                width: 100.w,
                child: Image.asset('assets/explore_dark.png'),
              ),
        backgroundColor:
            themeProvider.themeMode == ThemeMode.dark ? black : white,
        actions: [
          SwitchTheme(themeProvider: themeProvider),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
              ),
              height: 48.h,
              width: 380.w,
              child: TextField(
                onChanged: (value) {
                  countryProvider.searchCountries(value);
                },
                controller: searchController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  fillColor: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.grey.shade800
                      : GlobalColors.lightSearchColor,
                  filled: true,
                  hintText: 'Search Country',
                  // contentPadding: EdgeInsets.only(right: 40),
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 73.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 0.2,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? white
                            : black,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.language),
                        Text(
                          'EN',
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 86.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 0.2,
                        color: themeProvider.themeMode == ThemeMode.dark
                            ? white
                            : black,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.filter_alt_outlined),
                        Text(
                          'Filter',
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Expanded(
              child: countryProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: countryProvider.countries.length,
                      itemBuilder: (context, index) {
                        final country = countryProvider.countries[index];
                        final firstLetter = country.name[0].toUpperCase();
                        bool showFirstLetter = index == 0 ||
                            countryProvider.countries[index - 1].name[0]
                                    .toUpperCase() !=
                                firstLetter;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (showFirstLetter)
                              Text(firstLetter,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  )),
                            SizedBox(
                              height: 8.h,
                            ),
                            CountryTile(country: country),
                            SizedBox(
                              height: 8.h,
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchTheme extends StatelessWidget {
  const SwitchTheme({
    super.key,
    required this.themeProvider,
  });

  final ThemeViewModel themeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0.w),
      child: IconButton(
        icon: Icon(themeProvider.themeMode == ThemeMode.dark
            ? Icons.dark_mode_outlined
            : Icons.light_mode),
        onPressed: () {
          themeProvider.toggleTheme();
        },
      ),
    );
  }
}
