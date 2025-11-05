import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';
import 'package:tecnic_test_bloc_open_api/views/countries_online/search/components/search_bar.dart';

Widget searchBody(Widget content) {
  return Padding(
    padding: EdgeInsets.all(SpacesBetweenContent.pading),
    child: Column(
      children: [
        const SearchCountryBar(),
        content,
      ],
    ),
  );
}
