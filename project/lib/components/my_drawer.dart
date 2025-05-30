import 'package:flutter/material.dart';
import 'package:project/components/my_list_tile.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Center(
                child: Icon(Icons.trolley,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,),
              )),
              
              const SizedBox(height: 25,),
              
              MyListTile(text: "Shop", icon: Icons.shop, onTap: () => Navigator.pop(context),),
              
              MyListTile(text: "Cart", icon: Icons.shopping_cart, onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/cart_page');
              },),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
          child: MyListTile(text: "Exit", icon: Icons.logout, onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/IntroPage', (route) => false),
          ),),

          
        ],
      ),


      

      
          //drawerheader or logo
  


    );
  }
}