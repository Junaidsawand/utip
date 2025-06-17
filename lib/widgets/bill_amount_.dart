import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required this.billAmount,
    required this.onChanged,
  });
  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money),
        labelText: "BILL AMOUNT",
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        // Call the onChanged callback with the new value
        onChanged(value);
      },
    );
  }
}
