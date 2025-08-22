import 'package:admin_site/data_table/patient_data_table2.dart';
import 'package:admin_site/models/patient_model.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final patients = List.generate(
      50, // test dataset
      (index) => PatientModel(
        name: "P. Ravi Krishna",
        patientId: "ea1200",
        mobileNumber: "99084 40000",
        email: "ravi12@gmail.com",
        gender: "Male",
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Patients")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PatientDataTable2(patients: patients),
      ),
    );
  }
}
