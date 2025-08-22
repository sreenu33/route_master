import 'package:admin_site/models/patient_model.dart';
import 'package:admin_site/data_table/patient_data_source.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class PatientDataTable2 extends StatelessWidget {
  final List<PatientModel> patients;
  const PatientDataTable2({super.key, required this.patients});

  @override
  Widget build(BuildContext context) {
    final dataSource = PatientDataSource(patients);

    return PaginatedDataTable2(
      columns: const [
        DataColumn2(label: Text("Sl.No"), size: ColumnSize.S),
        DataColumn2(label: Text("Name"), size: ColumnSize.L),
        DataColumn2(label: Text("Patient ID"), size: ColumnSize.M),
        DataColumn2(label: Text("Mobile Number"), size: ColumnSize.M),
        DataColumn2(label: Text("Email"), size: ColumnSize.L),
        DataColumn2(label: Text("Gender"), size: ColumnSize.S),
        DataColumn2(label: Text("Action"), size: ColumnSize.L),
      ],
      source: dataSource,
      columnSpacing: 10,
      horizontalMargin: 10,
      minWidth: 800,
      headingRowColor: MaterialStatePropertyAll(Colors.white),
      showCheckboxColumn: false,
      rowsPerPage: 10, // 👈 how many rows you want per page
      dataRowHeight: 34, // default is 56
      headingRowHeight: 40,
      border: TableBorder(
        horizontalInside: BorderSide(color: Colors.black, width: 0.5),
        verticalInside: BorderSide(color: Colors.black, width: 0.5),
        top: BorderSide.none,
        bottom: BorderSide.none,
        left: BorderSide.none,
        right: BorderSide.none,
      ),
    );
  }
}
