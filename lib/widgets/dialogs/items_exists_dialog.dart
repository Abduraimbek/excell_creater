import 'package:excell_creater/app.dart';
import 'package:flutter/material.dart';

class ItemExistsDialog {
  Future<bool?> show() async {
    final result = await showDialog(
      context: navigatorKey.currentState!.context,
      builder: (_) => AlertDialog(
        title: const Text("Item exists with this barcode!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(navigatorKey.currentState!.context, true);
            },
            child: const Text(
              "Edit exist product",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(navigatorKey.currentState!.context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );

    return result;
  }
}
