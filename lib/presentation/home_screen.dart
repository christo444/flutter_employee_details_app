import 'package:flutter/material.dart';
import 'screen_payslip.dart'; 

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final salaryController = TextEditingController();
  List<String> employeeDepartment=['CS','AI','CE','EE'];

  String? selectedDepartment;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Employee Details"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                validator: (value) {
                  if(value!.isEmpty || value == null){
                    return "Employee name is required";
                  }
                },
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Employee Name",
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: idController,
                decoration: InputDecoration(
                    hintText: "Employee ID",
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 40, left: 30, right: 30),
            //   child: DropdownButton<String>(
            //     value: selectedDepartment,
            //     hint: Text("Select a department"),
            //     isExpanded: true,
            //     items: [
            //       DropdownMenuItem(child: Text('IT'), value: 'IT'),
            //       DropdownMenuItem(child: Text('HR'), value: 'HR'),
            //       DropdownMenuItem(child: Text('Finance'), value: 'Finance'),
            //     ],
            //     onChanged: (value) {
            //       setState(() {
            //         selectedDepartment = value;
            //       });
            //     },
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 30,left: 20,right: 20),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5)
                   )
                ),
                  items: employeeDepartment.map((department){
                         return DropdownMenuItem(
                           child: Text(department),
                           value:department);
                  }).toList(), 
                  hint: Text("select Department"),
                  value: selectedDepartment,
                  onChanged: (newDepartment){
                     selectedDepartment=newDepartment!;
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: salaryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Basic Salary",
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  if(_formkey.currentState!.validate()){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenPayslip(
                        name: nameController.text,
                        id: idController.text,
                        department: selectedDepartment ?? 'N/A',
                        basic: int.tryParse(salaryController.text) ?? 0,
                      ),
                    ),
                  );}
                },
                child: Text(
                  "Process",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shadowColor: Colors.black,
                  elevation: 10
                )
                ),
              ),
          ],
        ),
      ),
    );
  }
}