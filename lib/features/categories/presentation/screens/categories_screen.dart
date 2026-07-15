import 'package:ecommerce_app_api_26/features/categories/data/categories_api/Categories_api.dart';
import 'package:ecommerce_app_api_26/features/categories/data/models/categoriesModel.dart';
import 'package:ecommerce_app_api_26/features/categories/presentation/screens/productsbycategory.dart';
import 'package:ecommerce_app_api_26/features/categories/presentation/widgets/categories_card.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'name': 'Electronics', 'icon': Icons.electrical_services_outlined, 'color': Colors.orange},
      {'name': 'Fashion', 'icon': Icons.checkroom_outlined, 'color': Colors.pink},
      {'name': 'Home', 'icon': Icons.home_work_outlined, 'color': Colors.green},
      {'name': 'Books', 'icon': Icons.menu_book_outlined, 'color': Colors.purple},
      {'name': 'Beauty', 'icon': Icons.face_outlined, 'color': Colors.red},
      {'name': 'Sports', 'icon': Icons.sports_basketball_outlined, 'color': Colors.blue},
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(future: CategoriesApi().getAllCategories(), builder:(context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasError||snapshot.data==null) {
          return Center(child: Text(snapshot.error.toString(),
            style: TextStyle(color: Colors.red, fontWeight: .bold, fontSize: 15),));
        }
        List<CategoriesModel>?categories=snapshot.data;
        return
          GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categories!.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Productsbycategory(id: category.id??1) ,));
                },
                child: CategoryCard(id: category.id
                    , name:category.name , imageUrl:
                category.image),
              );
            },
          );
      },)
    );
  }
}
