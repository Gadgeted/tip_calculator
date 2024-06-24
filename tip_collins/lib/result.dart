import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double totalBill;
  final double perPersonBill;

  const ResultScreen(
      {required this.totalBill, required this.perPersonBill, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "The Total Bill is: KES ${totalBill.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                "Per person Share is: KES ${perPersonBill.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
