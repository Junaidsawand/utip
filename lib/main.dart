import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount_.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 58, 4, 144),
        ),
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;

  double _tipPercentage = 0;
  double _billTotal = 0;
  double totalPerPerson() {
    return (_billTotal * _tipPercentage + (_billTotal)) / _personCount;
  }

  double totalTip() {
    return (_billTotal * _tipPercentage);
  }

  //methods
  void increament() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decreament() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(title: Text("UTip")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.15,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Total per person", style: style),
                  Text(
                    "$total",
                    style: style.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: theme.textTheme.displaySmall?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(),
                    onChanged: (String value) {
                      // Handle the bill amount change
                      // You can update the state or perform any action here
                      // print("Bill Amount: $value");
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                    },
                  ),
                  //split bill area
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onDecreament: decreament,
                    onIncreament: increament,
                  ),
                  //tip area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip ", style: theme.textTheme.titleMedium),
                      Text("$totalT ", style: theme.textTheme.titleMedium),
                    ],
                  ),
                  //slider text
                  Text("${(_tipPercentage * 100).round()}%"),
                  //tip slider
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) {
                      setState(() {
                        _tipPercentage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
