import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? name;
  final String? id;
  const Product(this.name, this.id);
  @override
  List<Object?> get props => [name, id];
}

class Dimension extends Equatable {
  final String? name;
  final double? upperBound;
  final double? lowerBound;
  const Dimension(
    this.name,
    this.upperBound,
    this.lowerBound,
  );
  @override
  List<Object?> get props => [name, upperBound, lowerBound];
}

class AppearanceError extends Equatable {
  final String? name;
  // final String? fileImageErr;
  // final String? informationErr;
  const AppearanceError(
    this.name, 
    // this.fileImageErr, 
    // this.informationErr
    );
  @override
  List<Object?> get props => [
    name, 
    // fileImageErr, 
    // informationErr
    ];
}

/// get Image And Information Appearance Errors
// class AppearanceErrorInformation extends Equatable{
//   final String? contentError;
//   final String? imageId;
//   const AppearanceErrorInformation(this.contentError, this.imageId);
//   @override
//   List<Object?> get props => [contentError,imageId];
// }

class Standard extends Equatable {
  final String? id;
  final Product? product;
  final List<Dimension>? dimensions;
  final List<AppearanceError>? appearanceErrors;
  final String? fileLink;
  const Standard(this.id, this.product, this.dimensions, this.appearanceErrors,
      this.fileLink);
  @override
  List<Object?> get props =>
      [id, product, dimensions, appearanceErrors, fileLink];
}
