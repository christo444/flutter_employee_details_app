import 'package:flutter/material.dart';

class ScreenPayslip extends StatelessWidget {
  final String name;
  final String id;
  final String department;
  final int basic;

  const ScreenPayslip({
    super.key,
    required this.name,
    required this.id,
    required this.department,
    required this.basic,
  });

  @override
  Widget build(BuildContext context) {
    int hra = (basic * 0.3).toInt();
    int da = (basic * 0.5).toInt();
    int ta = (basic *0.15).toInt();
    int netSalary = basic + hra + da + ta;

    return Scaffold(
      appBar: AppBar(title: Text("Pay Slip")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Employee Name : $name", style: TextStyle(color: Colors.indigo,fontSize: 20)),
            Text("Employee ID : $id", style: TextStyle(color: Colors.pink,fontSize: 20)),
            Text("Employee Department : $department", style: TextStyle(color: Colors.indigo,fontSize: 20)),
            Text("Basic Salary : $basic", style: TextStyle(color: Colors.pink,fontSize: 20)),
            Text("HRA : $hra", style: TextStyle(color: Colors.pink,fontSize: 20)),
            Text("DA : $da", style: TextStyle(color: Colors.pink,fontSize: 20)),
            Text("TA : $ta", style: TextStyle(color: Colors.pink,fontSize: 20)),
            Text("Net Salary : $netSalary", style: TextStyle(color: Colors.indigo,fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
