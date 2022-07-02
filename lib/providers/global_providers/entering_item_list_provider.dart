import 'dart:developer';
import 'dart:io';

import 'package:excell_creater/providers/providers.dart';
import 'package:excell_creater/repositories/repositories.dart';
import 'package:excell_creater/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

final isReadingFileProvider = StateProvider<bool>((ref) => false);

final enteringItemListProvider =
    StateNotifierProvider<EnteringItemListNotifier, List<EnteringModel>>((ref) {
  return EnteringItemListNotifier(ref);
});

class EnteringItemListNotifier extends StateNotifier<List<EnteringModel>> {
  EnteringItemListNotifier(this._ref) : super(const []);

  final Ref _ref;
  List<EnteringModel> _list = [];

  void searchByName(String pattern) {
    state = _list
        .where((element) =>
            element.name.toLowerCase().contains(pattern.toLowerCase()))
        .toList();
  }

  void searchByPrName(String pattern) {
    state = _list
        .where((element) =>
            element.prName.toLowerCase().contains(pattern.toLowerCase()))
        .toList();
  }

  void searchByTradeName(String pattern) {
    state = _list
        .where((element) =>
            element.tradeName.toLowerCase().contains(pattern.toLowerCase()))
        .toList();
  }

  Future<void> pressItem(EnteringModel enteringModel) async {
    final exportedItem = _ref
        .read(exportListProvider.notifier)
        .checkItemIsExists(sqlId: enteringModel.id);

    if (exportedItem != null) {
      final result = await ItemExistsDialog().show();
      if (result == true) {
        await NewItemDialog().show(
          exportModel: exportedItem,
          newItemDialogEnum: NewItemDialogEnum.itemEdit,
        );
      }
    } else {
      await NewItemDialog().show(
        exportModel: ExportModel.fromEnteringModel(enteringModel),
        newItemDialogEnum: NewItemDialogEnum.itemCreate,
      );
    }
  }

  Future<void> onItemScanned(String barcode) async {
    final enteringModel =
        _list.firstWhereOrNull((element) => element.barcode == barcode);

    if (enteringModel == null) return;

    final exportedModel = _ref
        .read(exportListProvider.notifier)
        .checkItemIsExists(sqlId: enteringModel.id);

    if (exportedModel != null) {
      final result = await ItemExistsDialog().show();
      if (result == true) {
        await NewItemDialog().show(
          exportModel: exportedModel,
          newItemDialogEnum: NewItemDialogEnum.itemEdit,
        );
      }
    } else {
      await NewItemDialog().show(
        exportModel: ExportModel.fromEnteringModel(enteringModel),
        newItemDialogEnum: NewItemDialogEnum.itemCreate,
      );
    }
  }

  Future<void> readFile() async {
    _ref.read(isReadingFileProvider.notifier).state = true;

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      final file = File(result.files.single.path!);
      final fileStr = await file.readAsString();
      final rows = fileStr.split("\n");

      _list = [];
      for (int i = 0; i < rows.length; i++) {
        try {
          final rowItems = rows[i].split(",");
          _list.add(EnteringModel(
            id: rowItems[0],
            name: rowItems[1],
            prName: rowItems[2],
            barcode: rowItems[3],
            tradeName: rowItems[4],
            dosage: rowItems[5],
            form: rowItems[6],
          ));
        } catch (e) {
          log("entering_item_list_provider.dart --> _storeEnteringModel --> error --> $e");
        }
      }

      state = _list;
    } catch (e) {
      log("entering_item_list_provider.dart --> readFile --> error --> $e");
    }

    _ref.read(isReadingFileProvider.notifier).state = false;
  }
}
