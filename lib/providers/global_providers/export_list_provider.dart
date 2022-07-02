import 'dart:async';
import 'dart:io';

import 'package:excell_creater/repositories/repositories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';

final exportListProvider =
    StateNotifierProvider<ExportListNotifier, List<ExportModel>>((ref) {
  return ExportListNotifier(
    myStore.box<ExportModel>().getAll().reversed.toList(),
  );
});

class ExportListNotifier extends StateNotifier<List<ExportModel>> {
  ExportListNotifier(this.list) : super(list) {
    final stream = myStore.box<ExportModel>().query().watch();
    subscription = stream.listen((event) {
      list = event.find().reversed.toList();
      _setState();
    });
  }

  StreamSubscription? subscription;
  List<ExportModel> list;
  String _pattern = "";

  Future<void> export() async {
    final dir = await getApplicationDocumentsDirectory();
    File file = File(join(dir.path, "EXPORTED_FROM_EXCELL_CREATER.csv"));

    String contents = "";

    for (final e in list) {
      contents += e.toExcellString();
      contents += "\n";
    }

    await file.writeAsString(contents);
  }

  ExportModel? checkItemIsExists({required String sqlId}) {
    return list.firstWhereOrNull((element) => element.sqlId == sqlId);
  }

  void typeSearchPattern(String pattern) {
    _pattern = pattern;
    _setState();
  }

  void _setState() {
    if (_pattern == "") {
      state = list;
    } else {
      state = list.where((element) => element.barcode == _pattern).toList();
    }
  }
}
