import 'package:backoapp/models/product_model.dart';
import 'package:backoapp/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  final Product product;
  const DetailedScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.imageProduct), 
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: mainColor,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(product.publisherProduct,style: nameStyle.copyWith(fontSize: 16), overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 10),
                        Text(product.titleProduct,style: navbarStyle.copyWith(fontSize: 32, color: secondaryColor,), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(product.currencyProduct,style: priceStyle.copyWith(fontSize: 16),overflow: TextOverflow.ellipsis,),
                            const SizedBox(width: 5),
                            Text(product.priceProduct.toString(),style: priceStyle.copyWith(fontSize: 16),overflow: TextOverflow.ellipsis,),
                            const SizedBox(width: 5),
                            Text(product.rateProduct,style: priceStyle.copyWith(fontSize: 16),overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i=0; i<5; i++)
                              Icon(
                                i < product.starsProduct ? Icons.star : Icons.star_border,
                                color: selectedColor, size: 20,
                              ),
                            const SizedBox(width: 5),
                            Text(product.ratingProduct.toString(),style: ratingStyle.copyWith(fontSize: 18),)
                          ],
                        )                                                               
                      ],
          ),
        )
      )
    );
  }
}