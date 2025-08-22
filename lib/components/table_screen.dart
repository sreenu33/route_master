import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'custom_table_widget.dart';
import 'table_column_config.dart';
import 'table_data_grid_source.dart';

class TableScreen extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final List<TableColumnConfig> columns;

  const TableScreen({super.key, required this.data, required this.columns});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late List<Map<String, dynamic>> filteredData;
  late TableDataGridSource source;
  final TextEditingController searchController = TextEditingController();
  int currentPage = 1;
  int rowsPerPage = 10;
  int totalPages = 1;

  List<Map<String, dynamic>> get paginatedData {
    final start = (currentPage - 1) * rowsPerPage;
    final end = (start + rowsPerPage).clamp(0, filteredData.length);
    return filteredData.sublist(start, end);
  }

  void updateSource() {
    source = TableDataGridSource(
      rawData: paginatedData,
      columnConfigs: widget.columns,
    );
  }

  @override
  void initState() {
    super.initState();
    filteredData = List.from(widget.data);
    totalPages = (filteredData.length / rowsPerPage).ceil();
    updateSource();
  }

  void _onSearchChanged(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredData = widget.data.where((row) {
        return widget.columns.any((col) {
          final value = col.valueBuilder?.call(row) ?? row[col.key];
          return value.toString().toLowerCase().contains(lowerQuery);
        });
      }).toList();

      currentPage = 1;
      totalPages = (filteredData.length / rowsPerPage).ceil();
      updateSource();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Field
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: _onSearchChanged,
          ),
        ),

        // Table
        Expanded(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(scrollbars: true),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: SfDataGrid(
                  source: source,
                gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  columnWidthMode: ColumnWidthMode.fill,
                  rowHeight: 38,
                  columns: widget.columns
                      .map((c) => CustomWidgets.buildGridColumn(c.title, c.key))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        // --- Pagination Controls ---
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: currentPage > 1
                    ? () {
                        setState(() {
                          currentPage--;
                          updateSource();
                        });
                      }
                    : null,
                child: const Text('Previous'),
              ),
              const SizedBox(width: 16),
              Text('Page $currentPage of $totalPages'),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: currentPage < totalPages
                    ? () {
                        setState(() {
                          currentPage++;
                          updateSource();
                        });
                      }
                    : null,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
