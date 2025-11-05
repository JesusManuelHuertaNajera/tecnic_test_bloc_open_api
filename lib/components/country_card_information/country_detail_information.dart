import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/button.dart';
import 'package:tecnic_test_bloc_open_api/components/custom_input.dart';
import 'package:tecnic_test_bloc_open_api/components/snack.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/BD/main.dart';

Widget buildEditableFields(BuildContext context, CountryModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomInputField(
        label: 'Capital',
        readOnly: model.id == null,
        initialValue: model.capital,
        onChanged: (text) => model.capital = text,
      ),
      const SizedBox(height: 10),
      CustomInputField(
        label: 'Moneda',
        readOnly: model.id == null,
        initialValue: model.currencies,
        onChanged: (text) => model.currencies = text,
      ),
      const SizedBox(height: 10),
      CustomInputField(
        label: 'Nombres nativos',
        readOnly: model.id == null,
        initialValue: model.nativeNames,
        onChanged: (text) => model.nativeNames = text,
      ),
      const SizedBox(height: 20),
      if (model.id != null)
        Center(
          child: pillButton(
            text: "Actualizar",
            onPressed: () async {
              int result = await DatabaseService.instance.updateCountry(model);
              showSnack(context, result != 0);
            },
          ),
        ),
    ],
  );
}
