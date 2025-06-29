import 'package:ecommerce_app/pages/products_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(   backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hi, Jonathan",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Let's go shopping",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,tabs: [
              Tab(text: "Home",),
              Tab(text: "Category")
            ])),
        body: TabBarView(
          children: [
            Center(child: ProductsPage()),
            Center(child: Text("Second")),
          ],
        ),
      ),
    );
  }
}
