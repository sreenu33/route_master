import 'package:admin_site/models/patient_model.dart';
import 'package:flutter/material.dart';

class PatientDataSource extends DataTableSource {
  final List<PatientModel> patients;
  PatientDataSource(this.patients);

  @override
  DataRow? getRow(int index) {
    if (index >= patients.length) return null;
    final patient = patients[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text("${index + 1}".padLeft(2, '0'))),
        DataCell(Text(patient.name)),
        DataCell(Text(patient.patientId)),
        DataCell(Text(patient.mobileNumber)),
        DataCell(Text(patient.email)),
        DataCell(Text(patient.gender)),
        DataCell(
  Row(
    mainAxisSize: MainAxisSize.min, // keeps Row compact
    children: [
      // Edit button
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 80), // limit width
        child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit, color: Colors.black87, size: 18),
          label: const Text(
            "Edit",
            style: TextStyle(color: Colors.black87, fontSize: 14),
            overflow: TextOverflow.ellipsis, // prevent overflow
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            minimumSize: Size.zero, // shrink button
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
      const SizedBox(width: 4),

      // Delete button
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 90), // limit width
        child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.delete, color: Colors.red, size: 18),
          label: const Text(
            "Delete",
            style: TextStyle(color: Colors.red, fontSize: 14),
            overflow: TextOverflow.ellipsis, // prevent overflow
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ),
    ],
  ),
),

      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => patients.length;

  @override
  int get selectedRowCount => 0;
}
