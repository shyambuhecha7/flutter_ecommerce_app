import 'package:ecommerce_app/controllers/bottom_nav_controller.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:ecommerce_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final BottomNavController bottomNavViewModel = Get.put(BottomNavController());

  final List<Widget> pages = [HomePage(), OrderPage(), HomePage(),HomePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavViewModel.selectedIndex.value,
        onTap:bottomNavViewModel.changeTabIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining),label: "Order"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
        ],
      ),
      body: pages[bottomNavViewModel.selectedIndex.value],
    ));
  }
}
