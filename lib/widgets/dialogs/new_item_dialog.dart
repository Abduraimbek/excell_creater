import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:excell_creater/app.dart';
import 'package:excell_creater/objectbox.g.dart';
import 'package:excell_creater/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

InputDecoration myInputDecoration(String label) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    labelText: label,
  );
}

enum NewItemDialogEnum { itemCreate, itemEdit }

class NewItemDialog {
  Future<void> show({
    required ExportModel? exportModel,
    required NewItemDialogEnum newItemDialogEnum,
  }) async {
    await showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => AlertDialog(
        content: _NewItemDialog(
          exportModel: exportModel,
          newItemDialogEnum: newItemDialogEnum,
        ),
      ),
    );
  }
}

class _NewItemDialog extends HookConsumerWidget {
  const _NewItemDialog({
    Key? key,
    required this.exportModel,
    required this.newItemDialogEnum,
  }) : super(key: key);

  final ExportModel? exportModel;
  final NewItemDialogEnum newItemDialogEnum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final sqlIdController = useTextEditingController(text: exportModel?.sqlId);
    final nameController = useTextEditingController(text: exportModel?.name);
    final prNameController =
        useTextEditingController(text: exportModel?.prName);
    final barcodeController =
        useTextEditingController(text: exportModel?.barcode);
    final tradeNameController =
        useTextEditingController(text: exportModel?.tradeName);
    final dosageController =
        useTextEditingController(text: exportModel?.dosage);
    final formController = useTextEditingController(text: exportModel?.form);
    final priceController = useTextEditingController(text: exportModel?.price);
    final inStockController =
        useTextEditingController(text: exportModel?.inStock);
    final expiredDateController =
        useTextEditingController(text: exportModel?.expiredDate);
    final serieController = useTextEditingController(text: exportModel?.serie);

    final sqlIdFocusNode = useFocusNode();
    final nameFocusNode = useFocusNode();
    final prNameFocusNode = useFocusNode();
    final barcodeFocusNode = useFocusNode();
    final tradeNameFocusNode = useFocusNode();
    final dosageFocusNode = useFocusNode();
    final formFocusNode = useFocusNode();
    final priceFocusNode = useFocusNode();
    final inStockFocusNode = useFocusNode();
    final expiredDateFocusNode = useFocusNode();
    final serieFocusNode = useFocusNode();

    return Container(
      width: size.width / 2,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    nameFocusNode.requestFocus();
                  },
                  controller: sqlIdController,
                  focusNode: sqlIdFocusNode,
                  decoration: myInputDecoration("SQL Id"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    prNameFocusNode.requestFocus();
                  },
                  controller: nameController,
                  focusNode: nameFocusNode,
                  decoration: myInputDecoration("Name"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    barcodeFocusNode.requestFocus();
                  },
                  controller: prNameController,
                  focusNode: prNameFocusNode,
                  decoration: myInputDecoration("PR Name"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    tradeNameFocusNode.requestFocus();
                  },
                  controller: barcodeController,
                  focusNode: barcodeFocusNode,
                  decoration: myInputDecoration("Barcode"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    dosageFocusNode.requestFocus();
                  },
                  controller: tradeNameController,
                  focusNode: tradeNameFocusNode,
                  decoration: myInputDecoration("Trade Name"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    formFocusNode.requestFocus();
                  },
                  controller: dosageController,
                  focusNode: dosageFocusNode,
                  decoration: myInputDecoration("Dosage"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    priceFocusNode.requestFocus();
                  },
                  controller: formController,
                  focusNode: formFocusNode,
                  decoration: myInputDecoration("Form"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  autofocus: true,
                  onSubmitted: (value) {
                    inStockFocusNode.requestFocus();
                  },
                  controller: priceController,
                  focusNode: priceFocusNode,
                  decoration: myInputDecoration("Price"),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      symbol: "",
                      decimalDigits: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    expiredDateFocusNode.requestFocus();
                  },
                  controller: inStockController,
                  focusNode: inStockFocusNode,
                  decoration: myInputDecoration("In Stock"),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    serieFocusNode.requestFocus();
                  },
                  controller: expiredDateController,
                  focusNode: expiredDateFocusNode,
                  decoration: myInputDecoration("Expired Date"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            onSubmitted: (value) {},
            controller: serieController,
            focusNode: serieFocusNode,
            decoration: myInputDecoration("Serie"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final exportItem = ExportModel(
                sqlId: sqlIdController.text,
                name: nameController.text,
                prName: prNameController.text,
                barcode: barcodeController.text,
                tradeName: tradeNameController.text,
                dosage: dosageController.text,
                form: formController.text,
                price: priceController.text,
                inStock: inStockController.text,
                expiredDate: expiredDateController.text,
                serie: serieController.text,
              );

              final box = myStore.box<ExportModel>();

              /// new item create button bosilgan vaqtda
              if (exportModel == null) {
                box.put(exportItem);
              } else {
                if (newItemDialogEnum == NewItemDialogEnum.itemCreate) {
                  box.put(exportItem);
                } else if (newItemDialogEnum == NewItemDialogEnum.itemEdit) {
                  box.remove(exportModel!.id);
                  box.put(exportItem);
                }
              }

              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 45),
            ),
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }
}
