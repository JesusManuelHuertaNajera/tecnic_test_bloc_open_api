import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/country_card_information/country_information.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';

class MyCountryDetailPage extends StatefulWidget {
  CountryModel countryInfo;
  MyCountryDetailPage({super.key, required this.countryInfo});

  @override
  State<MyCountryDetailPage> createState() => _MyCountryDetailPageState();
}

class _MyCountryDetailPageState extends State<MyCountryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Detalles",
            style: TextStylesCustom.titleMain(fontWeightC: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(SpacesBetweenContent.pading),
          child:
              contentCountry(model: widget.countryInfo, isGeneralScreen: false),
        ),
      ),
    );
  }
}
