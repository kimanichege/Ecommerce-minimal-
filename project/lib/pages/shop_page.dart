import 'package:flutter/material.dart';
import 'package:project/components/my_drawer.dart';
import 'package:project/components/product_tile.dart';
import 'package:project/models/shop.dart';
import 'package:provider/provider.dart';
class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access product in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("Shop Page")),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/cart_page'), icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: ListView(
        children: [

          const SizedBox(height: 25,),
          //shop title
          Center(child: Text("Pick your product from selected premium products",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),

      SizedBox(
        height: 550,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(15),
          itemBuilder: (context, index) {
            //get each individualproduct from shop
        
            final product = products[index];
        
            return ProductTile(product: product
              
            );
          },
        ),
      ),
        ],

      )

        );
  }
}