import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'table_column_config.dart';

typedef CellBuilder = Widget Function(Map<String, dynamic> rowData);

class TableDataGridSource extends DataGridSource {
  final List<DataGridRow> _rows;
  final List<Map<String, dynamic>> rawData;

  TableDataGridSource({
    required this.rawData,
    required List<TableColumnConfig> columnConfigs,
  }) : _rows = rawData.map((data) {
          return DataGridRow(
            cells: columnConfigs.map((config) {
              final value = config.valueBuilder?.call(data) ?? data[config.key];
              return DataGridCell<dynamic>(
                columnName: config.key,
                value: value,
              );
            }).toList(),
          );
        }).toList();

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = _rows.indexOf(row);
    return DataGridRowAdapter(
      color: rowIndex % 2 == 0 ? Colors.grey[50] : Colors.white,
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: cell.value is Widget
              ? cell.value
              : Text(
                  cell.value?.toString() ?? '',
                  textAlign: TextAlign.center,
                ),
        );
      }).toList(),
    );
  }
}
