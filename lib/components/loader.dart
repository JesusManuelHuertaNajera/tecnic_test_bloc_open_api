import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';

Widget loaderScreen() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Center(child: CircularProgressIndicator()),
      SizedBox(
        height: SpacesBetweenContent.spaceHeight,
      ),
       Text("Cargando...",style: TextStylesCustom.normalText(),)
    ],
  );
}
