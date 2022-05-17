import 'package:cha_qaqc_department_mobile_app/domain/entities/qa_data.dart';

class ProductModel extends Product {
  const ProductModel({String? name, String? id}) : super(name, id);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"] as String,
      id: json["id"] as String,
    );  
  }
}

class DimensionModel extends Dimension {
  const DimensionModel({String? name, double? upperBound, double? lowerBound})
      : super(name, upperBound, lowerBound);

  factory DimensionModel.fromJson(Map<String, dynamic> json) {
    return DimensionModel(
      name: json["name"] as String,
      upperBound: double.parse(json["upperBound"].toString()),
      lowerBound: double.parse(json["lowerBound"].toString()),
    );
  }
}

class AppearanceErrorModel extends AppearanceError {
  const AppearanceErrorModel(
      {String? name, String? fileImageErr, String? informationErr})
      : super(name, 
      // fileImageErr, 
      // informationErr
      );

  factory AppearanceErrorModel.fromJson(Map<String, dynamic> json) {
    return AppearanceErrorModel(
      name: json["name"] as String,
      fileImageErr: json[''],
      informationErr: json[''],
    );
  }
}

// }
class StandardModel extends Standard {
  const StandardModel(
      {String? id,
      Product? product,
      List<Dimension>? dimensions,
      List<AppearanceError>? appearanceErrors,
      String? fileLink})
      : super(
          id,
          product,
          dimensions,
          appearanceErrors,
          fileLink,
        );

  factory StandardModel.fromJson(Map<String, dynamic> json) {
    return StandardModel( 
        id: json["id"] as String,
        product: json["product"] != null
            ? ProductModel.fromJson(json['product'])
            : null,
        fileLink: json["fileName"] as String,
        dimensions: json["dimensions"] == null
            ? []
            : (json["dimensions"] as List)
                .map((e) => DimensionModel.fromJson(e))
                .toList(),
        appearanceErrors: json["appearanceErrors"] == null
            ? []
            : (json["appearanceErrors"] as List)
                .map((e) => AppearanceErrorModel.fromJson(e))
                .toList());
  }
}
