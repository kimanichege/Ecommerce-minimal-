import 'package:flutter/material.dart';
import 'package:project/models/product.dart';

class Shop extends ChangeNotifier{
//product for sale
final  List<Product> _shop = [
  Product(name: "Shoes", description: "best comfortable shoes in the market give it a try", price: 99.99, imagePath: 'assets/camera.jpg'),

  Product(name: "laptop macAir", description: "Macbook air with 8gb RAM 2.0 GHZ Processor", price: 319.99, imagePath: 'assets/cars.jpg'),

  Product(name: "BMW M201", description: "BMW M with 720 horsepower,powered seats", price: 2019.99, imagePath: 'assets/laptop.jpg'),

  Product(name: "camon S20", description: "Camon S20 with high focus upto 200 metres", price: 209.99, imagePath: 'assets/shoes.jpg'),

];

//user cart
final List<Product> _cart = [];


//get user 
List<Product> get shop => _shop;

//get cart
List<Product> get cart => _cart;

//add item to cart
void addItem(Product item) {
  _cart.add(item);
  notifyListeners();
}


//remove item from cart
void removeItem(Product item) {
  _cart.remove(item);
  notifyListeners();
}

}