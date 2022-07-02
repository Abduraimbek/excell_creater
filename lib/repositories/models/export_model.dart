import 'package:excell_creater/repositories/repositories.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ExportModel {
  int id = 0;
  String sqlId;
  String name;
  String prName;
  String barcode;
  String tradeName;
  String dosage;
  String form;
  String price;
  String inStock;
  String expiredDate;
  String serie;

  ExportModel({
    required this.sqlId,
    required this.name,
    required this.prName,
    required this.barcode,
    required this.tradeName,
    required this.dosage,
    required this.form,
    required this.price,
    required this.inStock,
    required this.expiredDate,
    required this.serie,
  });

  factory ExportModel.fromEnteringModel(EnteringModel enteringModel) {
    return ExportModel(
      sqlId: enteringModel.id,
      name: enteringModel.name,
      prName: enteringModel.prName,
      barcode: enteringModel.barcode,
      tradeName: enteringModel.tradeName,
      dosage: enteringModel.dosage,
      form: enteringModel.form,
      price: "",
      inStock: "",
      expiredDate: "",
      serie: "",
    );
  }

  String toExcellString() {
    return "$sqlId,$name,$prName,$barcode,$tradeName,$dosage,$form,$price,$inStock,$expiredDate,$serie";
  }
}
