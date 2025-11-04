import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/button.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';

Widget errorLoadApi({required void Function()? onPressed}) {
  return Padding(
    padding: EdgeInsets.all(SpacesBetweenContent.pading),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hubo un problema al cargar la información. Por favor, inténtalo de nuevo más tarde.",
          style: TextStylesCustom.titleSecondary(),
        ),
        SizedBox(height: SpacesBetweenContent.spaceHeight,),
        pillButton(text: "Reintentar", onPressed: onPressed)
      ],
    ),
  );
}
