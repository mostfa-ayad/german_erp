// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/widgets.dart';

import 'package:german_erp/product/domin/product_model.dart';
import 'package:german_erp/product/presentation/product_form_screen.dart';

class ProductTable extends StatelessWidget {
  List<ProductModel> data;
  List<ExpandableColumn<dynamic>> headers = [];
  List<ExpandableRow> rows = [];
  ProductTable({
    super.key,
    required this.data,
  }) {
    createDataSource();
  }
  createDataSource() {
    String id = "ID";
    String name = "Name";
    String description = "Description";
    headers = [
      ExpandableColumn(columnTitle: id, columnFlex: 1),
      ExpandableColumn(columnTitle: name, columnFlex: 2),
      ExpandableColumn(columnTitle: description, columnFlex: 3)
    ];

    rows = data
        .map((e) => ExpandableRow(cells: [
              ExpandableCell(columnTitle: id, value: e.id),
              ExpandableCell(columnTitle: name, value: e.name),
              ExpandableCell(columnTitle: description, value: e.description)
            ]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: ExpandableThemeData(context),
      child: ExpandableDataTable(
        visibleColumnCount: 3,
        headers: headers,
        rows: rows,
        renderEditDialog: (row, onSuccess) => ProductFormScreen(
            isNew: false,
            product: ProductModel(
                id: row.cells[0].value,
                name: row.cells[1].value,
                description: row.cells[2].value,
                createdAt: DateTime.now())),
      ),
    );
  }
}
