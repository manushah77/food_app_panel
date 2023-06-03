class AddProductModel {
  String? productName;
  String? productType;
  String? productImage;
  double? productPrice;
  List? productUnit;
  String? productId;

  AddProductModel({
    this.productUnit,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productType,
    this.productId
  });

  AddProductModel.fromMap(Map<String, dynamic> map) {
    productId = map['productId'];
    productName = map['productName'];
    productPrice = map['productPrice'];
    productImage = map['productImage'];
    productUnit = map['productUnit'];
    productType = map['productType'];
  }

  Map<String ,dynamic> toMap() {
    return{
      'productId' : productId,
      'productName' : productName,
      'productPrice': productPrice,
      'productImage' : productImage,
      'productType' : productType,
      'productUnit' : productUnit,
    };
  }

}
