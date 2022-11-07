import 'dart:convert';

import 'modules.dart';

List<IAPItem> extractItems(dynamic result) {
  List list = json.decode(result.toString());
  List<IAPItem> products = list
      .map<IAPItem>(
        (dynamic product) => IAPItem.fromJSON(product as Map<String, dynamic>),
      )
      .toList();

  return products;
}

List<PurchasedItem> extractPurchased(dynamic result) {
  List<PurchasedItem> decoded = json
      .decode(result.toString())
      .map<PurchasedItem>(
        (dynamic product) =>
            PurchasedItem.fromJSON(product as Map<String, dynamic>),
      )
      .toList();

  return decoded;
}

List<PurchaseResult> extractResult(dynamic result) {
  List<PurchaseResult> decoded = json
      .decode(result.toString())
      .map<PurchaseResult>(
        (dynamic product) =>
            PurchaseResult.fromJSON(product as Map<String, dynamic>),
      )
      .toList();

  return decoded;
}

class EnumUtil {
  /// return enum value
  ///
  /// example: enum Type {Hoge},
  /// String value = EnumUtil.getValueString(Type.Hoge);
  /// assert(value == "Hoge");
  static String getValueString(dynamic enumType) =>
      enumType.toString().split('.')[1];
}
