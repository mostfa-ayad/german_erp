// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:german_erp/customer_service/domin/customer_service_model.dart';

class CustomerServiceTable extends StatelessWidget {
  List<CustomerServiceModel> data;
  late List<ExpandableRow> rows;
  List<ExpandableColumn<dynamic>> headers = [
    ExpandableColumn<int>(columnTitle: "ID", columnFlex: 1),
    ExpandableColumn(columnTitle: "Customer Name", columnFlex: 2),
    ExpandableColumn(columnTitle: "Address", columnFlex: 3)
  ];
  CustomerServiceTable({
    super.key,
    required this.data,
  }) {
    rows = data
        .map<ExpandableRow>((e) => ExpandableRow(cells: [
              ExpandableCell(columnTitle: "ID", value: e.id),
              ExpandableCell(
                  columnTitle: "Customer Name", value: e.customerName),
              ExpandableCell(columnTitle: "Address", value: e.address)
            ]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: ExpandableThemeData(
        context,
        rowBorder: const BorderSide(color: Colors.amber),
        expandedBorderColor: Colors.transparent,
        paginationSize: 48,
      ),
      child: ExpandableDataTable(
          isEditable: false,
          headers: headers,
          rows: rows,
          visibleColumnCount: 3),
    );
  }
}
