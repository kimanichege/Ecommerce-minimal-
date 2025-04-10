import 'package:flutter/material.dart';
import 'package:project/models/product.dart';
import 'package:project/models/shop.dart';
import 'package:provider/provider.dart';



class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  //add to cart method
  void additem(BuildContext context) {
    //show a dialog to ask the user to add 
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("Add this Item to Cart???"),
      actions: [
        //cancel button
        MaterialButton(onPressed: () => Navigator.pop(context), 
        child: Text('cancel'),
        ),

        //add button
        MaterialButton(onPressed: () {
          //pop dialog box
          Navigator.pop(context);

          //add to cart
          context.read<Shop>().addItem(product);

        },
        child: Text('yes'),
        ),

      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        //product image
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                  
                    
                ),
                //fill up the entire width
                width: double.infinity,
                padding: EdgeInsets.all(25),
                child: Image.asset(product.imagePath,
                fit: BoxFit.fill,
                ),),
            ),
            
            
            const SizedBox(height: 25,),
            
            
            //product name
            Text(product.name, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),),
            
            const SizedBox(height: 10,),
            
            //product descriptiom
            Text(product.description, style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),),
          ],
        ),
        
        const SizedBox(height: 25,),

        //product price + add cart button

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(product.price.toStringAsFixed(2)),

            //add cart button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)
              ),
              child: IconButton(onPressed: () => additem(context), icon: Icon(Icons.add))),

          ],
        ),
        ]
      ),

    );
  }
}