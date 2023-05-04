import 'package:ecommerce_app/screens/cartpage.dart';
import 'package:ecommerce_app/screens/details_page.dart';
import 'package:ecommerce_app/screens/homepage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: "ECommerce App ",
      routes: {
        '/': (ctx) => const Homepage(),
        'detail': (ctx) => const Detailspage(),
        'cart': (ctx) => const cartpage()
      },
    ),
  );
}