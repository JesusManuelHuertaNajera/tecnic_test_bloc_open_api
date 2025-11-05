  import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/button.dart';
import 'package:tecnic_test_bloc_open_api/components/snack.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/BD/main.dart';

Widget buildActionButtons(BuildContext context,CountryModel model, VoidCallback? onPressedViewMore,
   VoidCallback? onPressedDelete) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (model.id != null)
          pillButton(text: "Eliminar", onPressed: onPressedDelete),
        if (model.id == null)
          pillButton(
            text: "Guardar",
            onPressed: () async {
              int result = await DatabaseService.instance.insertCountry(model);
              showSnack(context, result != 0);
            },
          ),
        pillButton(
          text: "Ver más",
          onPressed: onPressedViewMore ??
              () {
                Navigator.pushNamed(context, '/countryDetails',
                    arguments: model);
              },
        ),
      ],
    );
  }
