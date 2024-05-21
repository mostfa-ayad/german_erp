// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expandable_datatable/expandable_datatable.dart';
import 'package:flutter/material.dart';
import 'package:german_erp/core/app_extintions.dart';

import 'package:german_erp/customer_service/domin/customer_service_model.dart';
import 'package:german_erp/customer_service/presentation/customer_service_form_screen.dart';

class CustomerServiceTable extends StatelessWidget {
  List<CustomerServiceModel> data;
  late List<ExpandableRow> rows;
  int columns = 5;
  List<ExpandableColumn<dynamic>> headers = [
    ExpandableColumn<int>(columnTitle: "ID", columnFlex: 1),
    ExpandableColumn(columnTitle: "Customer Name", columnFlex: 2),
    ExpandableColumn(columnTitle: "Address", columnFlex: 3),
    ExpandableColumn(columnTitle: "Phone", columnFlex: 3),
    ExpandableColumn(columnTitle: "Secondry Phone", columnFlex: 3),
    ExpandableColumn(columnTitle: "Description", columnFlex: 3),
    ExpandableColumn(columnTitle: "Employee Name", columnFlex: 3)
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
              ExpandableCell(columnTitle: "Phone", value: e.address),
              ExpandableCell(
                  columnTitle: "Secondry Phone", value: e.secondaryPhone),
              ExpandableCell(columnTitle: "Address", value: e.phone),
              ExpandableCell(columnTitle: "Description", value: e.phone),
              ExpandableCell(
                  columnTitle: "Employee Name", value: "employeeName"),
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
          renderEditDialog: (row, onSuccess) => CustomerServiceFormScreen(
              isNew: false,
              service: CustomerServiceModel(
                  id: row.cells[0].value,
                  createdAt: DateTime.now(),
                  customerName: row.cells[1].value,
                  phone: row.cells[2].value,
                  secondaryPhone: row.cells[3].value,
                  address: row.cells[4].value,
                  description: row.cells[5].value,
                  isComplete: false)),
          isEditable: true,
          headers: headers,
          rows: rows,
          visibleColumnCount: (context.width > 600) ? columns : 3),
    );
  }
}
