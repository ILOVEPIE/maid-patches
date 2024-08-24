import 'package:flutter/material.dart';
import 'package:maid/classes/providers/artificial_intelligence.dart';
import 'package:maid/classes/providers/large_language_model.dart';
import 'package:maid/ui/shared/tiles/slider_list_tile.dart';
import 'package:provider/provider.dart';

class NPredictParameter extends StatelessWidget {
  const NPredictParameter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtificialIntelligence>(
      builder: nPredictBuilder,
    );
  }

  Widget nPredictBuilder(BuildContext context, ArtificialIntelligence ai, Widget? child) {
    return SliderListTile(
      labelText: 'Predict Length',
      inputValue: ai.llm.nPredict,
      sliderMin: 1.0,
      sliderMax: 16384.0,
      sliderDivisions: 16383,
      onValueChanged: (value) {
        LargeLanguageModel.of(context).nPredict = value.round();
      }
    );
  }
}
