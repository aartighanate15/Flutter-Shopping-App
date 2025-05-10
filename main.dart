import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
//import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/pages/home_page.dart';
//import 'package:shop_app_flutter/home_page.dart';
//import 'package:shop_app_flutter/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Tagesschrift',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary:  const Color.fromRGBO(254, 206, 1, 1),
            ),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black
                
              )
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              prefixIconColor: Color.fromRGBO(119,119,119,1),
            ),
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
          
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
              bodySmall: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          useMaterial3: true,
      
        ),
       
          home: const HomePage(),
          ),
      
    );
  }
}