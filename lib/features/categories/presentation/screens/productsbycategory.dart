
import 'package:flutter/material.dart';

import '../../../home/data/models/ProductsModel.dart';
import '../../../home/data/products_api/products_api.dart';
import '../../../home/presentation/widgets/product_card.dart';

class Productsbycategory extends StatelessWidget {
  const Productsbycategory({super.key,required this.id});
 final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: ProductsApi().getProductsbyCategries(id), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasError||snapshot.data==null) {
          return Center(child: Text(snapshot.error.toString(),
            style: TextStyle(color: Colors.red, fontWeight: .bold, fontSize: 15),));
        }
        List<ProductsModel>?products=snapshot.data;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: products!.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                id: product.id!,
                title: product.title,
                price: product.price,
                description: product.description,
                image: product.images![0],
              );
            },
          ),
        );

      },),
    );
  }
}
