import 'package:flutter/material.dart';
import 'package:project/components/my_button.dart';
import 'package:project/models/product.dart';
import 'package:project/models/shop.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //remove item
  void removeItem (BuildContext context, Product product) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("Remove this Item to Cart???"),
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
          context.read<Shop>().removeItem(product);

        },
        child: Text('yes'),
        ),

      ],
    ));
  }

  //user pressed pay button
  void payButonPressed(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(content: Text('user wants to pay'),),);

  }


  @override
  Widget build(BuildContext context) {

    //get access to cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),

      ),


      //drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Column(children: [
        //cart list
        Expanded(
          child: cart.isEmpty ? Center(child: Text('Your cart is empty')):ListView.builder(itemCount: cart.length,itemBuilder: (context, index) {
          //get individual item 
          final item = cart[index];

          //return as list tile ui
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.price.toStringAsFixed(2)),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => removeItem(context, item),
            ),

          );

        })),

        //pay button
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: MyButton(onTap: () => payButonPressed(context), child: Text('pay now')),
        )

      ],),

    );
  }
}