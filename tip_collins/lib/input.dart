import 'package:flutter/material.dart';
import 'package:tip_collins/result.dart'; // Adjust the import path based on your project structure

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();

  @override
  void dispose() {
    _billController.dispose();
    _tipController.dispose();
    _peopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _billController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Bill Amount',
                ),
              ),
              TextFormField(
                controller: _tipController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tip Percentage',
                ),
              ),
              TextFormField(
                controller: _peopleController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number of People',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final double bill =
                      double.tryParse(_billController.text) ?? 0.0;
                  final double tip =
                      double.tryParse(_tipController.text) ?? 0.0;
                  final int people = int.tryParse(_peopleController.text) ?? 1;

                  final double totalBill = total(bill, tip);
                  final double perPersonBill =
                      perpersonShare(totalBill, people);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        totalBill: totalBill,
                        perPersonBill: perPersonBill,
                      ),
                    ),
                  );
                },
                child: const Text("Calculate"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double total(double bill, double tip) {
    return bill + (bill * tip / 100);
  }

  double perpersonShare(double totalBill, int noPerson) {
    return totalBill / noPerson;
  }
}
