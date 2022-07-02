import 'package:flutter/material.dart';

import 'item_scan_field/item_scan_field.dart';
import 'item_search_fields/item_search_fields.dart';
import 'items_list/items_list.dart';

class Left extends StatelessWidget {
  const Left({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ItemScanField(),
          ItemSearchFields(),
          SizedBox(height: 20),
          Expanded(child: ItemsList()),
        ],
      ),
    );
  }
}
