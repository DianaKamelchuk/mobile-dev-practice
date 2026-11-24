import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/corners_model.dart';

// Уся "секція": синій контейнер і чотири повзунки
class CornersSection extends StatelessWidget {
  const CornersSection({super.key});

  @override
  Widget build(BuildContext context) {
    // watch: віджет перемальовується при кожній зміні моделі
    final model = context.watch<CornersModel>();

    return Column(
      children: [
        const BluePreview(),
        const SizedBox(height: 48),
        Row(
          children: [
            Expanded(
              child: CornerSlider(
                label: 'TL',
                value: model.topLeft,
                onChanged: (v) => model.topLeft = v,
              ),
            ),
            Expanded(
              child: CornerSlider(
                label: 'TR',
                value: model.topRight,
                onChanged: (v) => model.topRight = v,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CornerSlider(
                label: 'BL',
                value: model.bottomLeft,
                onChanged: (v) => model.bottomLeft = v,
              ),
            ),
            Expanded(
              child: CornerSlider(
                label: 'BR',
                value: model.bottomRight,
                onChanged: (v) => model.bottomRight = v,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Синій контейнер 150x150, радіуси кутів беруться з моделі
class BluePreview extends StatelessWidget {
  const BluePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CornersModel>();

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(model.topLeft),
          topRight: Radius.circular(model.topRight),
          bottomLeft: Radius.circular(model.bottomLeft),
          bottomRight: Radius.circular(model.bottomRight),
        ),
      ),
    );
  }
}

// Підпис із значенням і повзунок для одного кутка
class CornerSlider extends StatelessWidget {
  const CornerSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: '$label: ',
            children: [
              TextSpan(
                text: value.toStringAsFixed(2),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: onChanged,
        ),
      ],
    );
  }
}