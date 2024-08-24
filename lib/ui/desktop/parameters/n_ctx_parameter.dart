import 'package:flutter/material.dart';
import 'package:maid/classes/providers/artificial_intelligence.dart';
import 'package:maid/classes/providers/large_language_model.dart';
import 'package:maid/ui/shared/tiles/slider_grid_tile.dart';
import 'package:provider/provider.dart';

class NCtxParameter extends StatelessWidget {
  const NCtxParameter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtificialIntelligence>(
      builder: nCtxBuilder,
    );
  }

  Widget nCtxBuilder(BuildContext context, ArtificialIntelligence ai, Widget? child) {
    return SliderGridTile(
      labelText: 'Context Length',
      inputValue: ai.llm.nCtx,
      sliderMin: 0.0,
      sliderMax: 16384.0,
      sliderDivisions: 16383,
      onValueChanged: (value) {
        LargeLanguageModel.of(context).nCtx = value.round();
      }
    );
  }
}
