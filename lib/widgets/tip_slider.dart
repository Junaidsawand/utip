import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({super.key, required double tipPercentage, this.onChanged})
    : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _tipPercentage,
      onChanged: onChanged,
      // // (value) => {
      // //   // setState(() {
      // //   //   // Update the UI if needed
      // //   //   _tipPercentage = value;
      // //   // }),
      // },
      min: 0,
      max: 0.5,
      divisions: 5,
      label: "${(_tipPercentage * 100).round()}%",
    );
  }
}
