import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartHelper {


  static Future<void> addToCart(Map<String, dynamic> productJson) async {

    final prefs = await SharedPreferences.getInstance();


    List<String> cartStrings = prefs.getStringList('user_cart') ?? [];

    String productString = jsonEncode(productJson);

    cartStrings.add(productString);

    await prefs.setStringList('user_cart', cartStrings);
  }




  static Future<List<Map<String, dynamic>>> getCartItems() async {

    final prefs = await SharedPreferences.getInstance();


    List<String> cartStrings = prefs.getStringList('user_cart') ?? [];

    return cartStrings.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
  }




  static Future<void> clearCart() async {

    final prefs = await SharedPreferences.getInstance();


    await prefs.remove('user_cart');
  }



}