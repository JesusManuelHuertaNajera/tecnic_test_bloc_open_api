import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/components/country_card_information/country_action_buttons.dart';
import 'package:tecnic_test_bloc_open_api/components/country_card_information/country_detail_information.dart';
import 'package:tecnic_test_bloc_open_api/components/custom_input.dart';
import 'package:tecnic_test_bloc_open_api/models/country_model.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/spaces_between.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';

class contentCountry extends StatelessWidget {
  final CountryModel model;
  final bool isGeneralScreen;
  final VoidCallback? onPressedViewMore;
  final VoidCallback? onPressedDelete;

  const contentCountry({
    super.key,
    required this.model,
    this.onPressedViewMore,
    this.onPressedDelete,
    this.isGeneralScreen = true,
  });

  @override
  Widget build(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isGeneralScreen && model.flag.isNotEmpty)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: SpacesBetweenContent.spaceHeight),
                            child: Image.network(model.flag,
                                errorBuilder: (_, __, ___) => const SizedBox()),
                          ),
                        ),
                      Text(model.nameOfficial,
                          style: TextStylesCustom.titleSecondary()),
                      const SizedBox(height: 10),
                      CustomInputField(
                        label: 'Nombre común',
                        initialValue: model.nameCommon,
                        readOnly: model.id == null || isGeneralScreen,
                        onChanged: (text) => model.nameCommon = text,
                      ),
                      if (!isGeneralScreen) ...[
                        const Divider(thickness: 3, color: Colors.white),
                        const SizedBox(height: 10),
                        buildEditableFields(context, model),
                      ],
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: SpacesBetweenContent.spaceWidth,
              ),
              if (isGeneralScreen)
                buildActionButtons(
                    context, model, onPressedViewMore, onPressedDelete),
            ],
          ),
        ),
      ),
    );
  }
}
