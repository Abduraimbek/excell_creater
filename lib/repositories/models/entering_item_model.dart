import 'package:flutter/material.dart' show immutable;

@immutable
class EnteringModel {
  final String id;
  final String name;
  final String prName;
  final String barcode;
  final String tradeName;
  final String dosage;
  final String form;

  const EnteringModel({
    required this.id,
    required this.name,
    required this.prName,
    required this.barcode,
    required this.tradeName,
    required this.dosage,
    required this.form,
  });

  EnteringModel copyWith() {
    return EnteringModel(
      id: id,
      name: name,
      prName: prName,
      barcode: barcode,
      tradeName: tradeName,
      dosage: dosage,
      form: form,
    );
  }
}
