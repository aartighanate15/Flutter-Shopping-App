import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //print(Provider.of<String>(context));

final cart = context.watch<CartProvider>().cart;   
//watch is continuouslly seeing
 return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 35,
              //give a rounded border,bg color,bg image,fg image
            ),
            trailing: IconButton(
              onPressed: (){ 
                showDialog(context: context,
                 builder: (context){
                  return AlertDialog(
                   title: Text('Delete Product'),
                   content: Text('Are you sure ? You want remove from your cart?',
                   ),
                   actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    child: Text('No', style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),),
                    ),
                     TextButton(onPressed: (){
                      context
                      .read<CartProvider>()
                      .removeProduct(cartItem);
                      //read is just read it once and leave it
                      Provider.of<CartProvider>(context,listen: false)
                      .removeProduct(cartItem);
                      Navigator.of(context).pop();
                     },
                      child: Text('Yes',
                      style: TextStyle(
                         color: Colors.red,
                      fontWeight: FontWeight.bold
                      ),),
                    ),
                   ],
                  );
                 });
                //show the dialog on the screen
              },
               icon: Icon(Icons.delete,
               color: Colors.red,
                )
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['title']}'),
          );

        },
        )
      );
    
  }
}