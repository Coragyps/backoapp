// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    final String currencyProduct;
    final String imageProduct;
    final int priceProduct;
    final String publisherProduct;
    final String rateProduct;
    final int ratingProduct;
    final int starsProduct;
    final String titleProduct;
    final int typeProduct;

    Product({
        required this.currencyProduct,
        required this.imageProduct,
        required this.priceProduct,
        required this.publisherProduct,
        required this.rateProduct,
        required this.ratingProduct,
        required this.starsProduct,
        required this.titleProduct,
        required this.typeProduct,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        currencyProduct: json["currencyProduct"],
        imageProduct: json["imageProduct"],
        priceProduct: json["priceProduct"],
        publisherProduct: json["publisherProduct"],
        rateProduct: json["rateProduct"],
        ratingProduct: json["ratingProduct"],
        starsProduct: json["starsProduct"],
        titleProduct: json["titleProduct"],
        typeProduct: json["typeProduct"],
    );

    Map<String, dynamic> toJson() => {
        "currencyProduct": currencyProduct,
        "imageProduct": imageProduct,
        "priceProduct": priceProduct,
        "publisherProduct": publisherProduct,
        "rateProduct": rateProduct,
        "ratingProduct": ratingProduct,
        "starsProduct": starsProduct,
        "titleProduct": titleProduct,
        "typeProduct": typeProduct,
    };
}
