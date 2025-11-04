import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/button.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';

Widget contentCountry(CountryModel model, [bool isGeneralScreen = true]) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: SpacesBetweenContent.pading),
    child: Card(
      color: Colors.grey[350],
      elevation: 12,
      child: Padding(
        padding: EdgeInsets.all(SpacesBetweenContent.pading),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.nameOfficial,
                    style: TextStylesCustom.titleSecondary(),
                  ),
                  SizedBox(
                    height: SpacesBetweenContent.spaceHeight,
                  ),
                  Text(
                    "Nombre común:",
                    style: TextStylesCustom.normalText(
                        fontWeightC: FontWeight.bold),
                  ),
                  Text(
                    model.nameCommon,
                    style: TextStylesCustom.normalText(),
                  ),
                  const Divider(
                    thickness: 3,
                    color: Colors.white,
                  ),
                  Visibility(
                      visible: !isGeneralScreen,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Capital:",
                            style: TextStylesCustom.normalText(
                                fontWeightC: FontWeight.bold),
                          ),
                          Text(
                            model.capital ?? "",
                            style: TextStylesCustom.normalText(),
                          ),
                          const Divider(
                            thickness: 3,
                            color: Colors.white,
                          ),
                          Text(
                            "Moneda:",
                            style: TextStylesCustom.normalText(
                                fontWeightC: FontWeight.bold),
                          ),
                          Text(
                            model.currencies,
                            style: TextStylesCustom.normalText(),
                          ),
                          const Divider(
                            thickness: 3,
                            color: Colors.white,
                          ),
                          Text(
                            "Nombre nativo:",
                            style: TextStylesCustom.normalText(
                                fontWeightC: FontWeight.bold),
                          ),
                          Text(
                            model.nativeNames,
                            style: TextStylesCustom.normalText(),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              width: SpacesBetweenContent.spaceWidth,
            ),
            Column(
              children: [
                pillButton(text: "Guardar", onPressed: () {}),
                pillButton(text: "Ver más", onPressed: () {})
              ],
            )
          ],
        ),
      ),
    ),
  );
}
