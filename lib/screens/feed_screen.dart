import 'package:backoapp/models/product_model.dart';
import 'package:backoapp/screens/menu_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  final int type;
  const FeedScreen({super.key, this.type = 1});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Container(

      child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Text(
                mainheadings.elementAt(widget.type)[0],
                style: titleStyle,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15, right: 15, bottom: 15,),
              child: Text(
                mainheadings.elementAt(widget.type)[1],
                style: subtitleStyle,
                textAlign: TextAlign.left,
              ),
            ),

            StreamBuilder <QuerySnapshot>(
              stream: firestore.collection('product').where('typeProduct', isEqualTo: widget.type).where('starsProduct', isEqualTo: 5).snapshots(),
              builder: (context, snapshot) {
                if(snapshot.connectionState== ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: selectedColor,));
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}', style: strongStyle,));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No se Encontro Productos', style: strongStyle,));
                }

                final products = snapshot.data!.docs.map((doc) {
                  final data=doc.data() as Map<String, dynamic>;
                  return Product.fromJson(data);
                }).toList();

                return SizedBox(
                  height: size.height * 0.23,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 9,),
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "detailedScreen", arguments: product);
                        },
                        child: Container(
                          width: size.width *0.75,
                          margin: const EdgeInsets.only(right: 9),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              product.imageProduct,
                              width: size.width * 0.75,
                              height: size.height * 0.22,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );

              }
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Text(
                mainheadings.elementAt(widget.type)[2],
                style: titleStyle,
                textAlign: TextAlign.left,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:15, right: 15, bottom: 20,),
              child: Text(
                mainheadings.elementAt(widget.type)[3],
                style: subtitleStyle,
                textAlign: TextAlign.left,
              ),
            ),


            StreamBuilder <QuerySnapshot>(
              stream: firestore.collection('product').where('typeProduct', isEqualTo: widget.type).snapshots(),
              builder: (context, snapshot) {
                if(snapshot.connectionState== ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: selectedColor,));
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}', style: strongStyle,));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No se Encontro Productos', style: strongStyle,));
                }
                final products = snapshot.data!.docs.map((doc) {
                  final data=doc.data() as Map<String, dynamic>;
                  return Product.fromJson(data);
                }).toList();

                return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 9,
                  shrinkWrap: true,
                  childAspectRatio: 0.9,
                  crossAxisCount: 2,
                  children: List.generate(products.length, (index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "detailedScreen", arguments: product);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(product.imageProduct, width: size.width*0.5, height: size.height*0.11, fit: BoxFit.cover,),
                          ),
                          Text(product.publisherProduct,style: nameStyle, overflow: TextOverflow.ellipsis,),
                          Text(product.titleProduct,style: strongStyle, maxLines: 2, overflow: TextOverflow.ellipsis,),
                          Row(
                            children: [
                              Text(product.currencyProduct,style: priceStyle,overflow: TextOverflow.ellipsis,),
                              const SizedBox(width: 5),
                              Text(product.priceProduct.toString(),style: priceStyle,overflow: TextOverflow.ellipsis,),
                              const SizedBox(width: 5),
                              Text(product.rateProduct,style: priceStyle,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                          Row(
                            children: [
                              for (int i=0; i<5; i++)
                                Icon(
                                  i < product.starsProduct ? Icons.star : Icons.star_border,
                                  color: selectedColor, size: 16,
                                ),
                              const SizedBox(width: 5),
                              Text(product.ratingProduct.toString(),style: ratingStyle,)
                            ],
                          )                                                               
                        ],
                      ),
                    );
                  }),
                );

              },
            )

        ],
      ),
    )

    );
  }
}