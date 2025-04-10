import 'package:flutter/material.dart';
import 'package:project/components/my_button.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.trolley,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),

            
            const SizedBox(height: 20),
        
            //title
            Text(
              'Minimal Shop',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),


            const SizedBox(height: 30,),
        
            //subtitle

            Text('Premium Quality Products',
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),

            const SizedBox(height: 10,),

            
        
        
            //button
            MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'), child: Icon(Icons.arrow_forward))
        
          ],
        ),
      ),

    );
  }
}