import 'package:flutter/material.dart';
import 'package:maid/classes/providers/artificial_intelligence.dart';
import 'package:maid/classes/providers/large_language_model.dart';
import 'package:maid/ui/shared/tiles/slider_grid_tile.dart';
import 'package:provider/provider.dart';

class NBatchParameter extends StatelessWidget {
  const NBatchParameter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtificialIntelligence>(
      builder: nBatchBuilder,
    );
  }

  Widget nBatchBuilder(BuildContext context, ArtificialIntelligence ai, Widget? child) {
    return SliderGridTile(
      labelText: 'Batch Size',
      inputValue: ai.llm.nBatch,
      sliderMin: 1.0,
      sliderMax: 16384.0,
      sliderDivisions: 16383,
      onValueChanged: (value) {
        LargeLanguageModel.of(context).nBatch = value.round();
      }
    );
  }
}
