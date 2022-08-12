import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerr/response/response.dart';
import 'package:providerr/screens/productlist/product_list.dart';


void main() {
  runApp(
   const MyApp(),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // ignore: unnecessary_const
          iconTheme: const IconThemeData(color: Colors.black)
        )
    
      ),
      home:  ChangeNotifierProvider(create: (_)=> ResponseJsonApi(),child: const ProductList(),),
    );
  }
}
