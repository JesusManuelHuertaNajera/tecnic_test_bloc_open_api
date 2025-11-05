import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/cubits/countries_information_search_api.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';

class SearchCountryBar extends StatefulWidget {
  const SearchCountryBar({super.key});

  @override
  State<SearchCountryBar> createState() => _SearchCountryBarState();
}

class _SearchCountryBarState extends State<SearchCountryBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CountriesSearchCubit>();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText: 'Buscar país...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: SpacesBetweenContent.spaceWidth),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[350]),
          onPressed: () {
            final query = searchController.text.trim();
            if (query == '') return;
            cubit.fetchCountries(query);
          },
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
