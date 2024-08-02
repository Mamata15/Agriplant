import 'package:agriplant/pages/explore_page.dart';
import 'package:agriplant/pages/about_us.dart';
import 'package:agriplant/pages/services_page.dart';
import 'package:agriplant/pages/contact_us_page.dart'; // Ensure this is properly defined
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const ServicesPage(),
    const ContactUs(), // Ensure this widget is defined
    const AboutUsPage(),
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/agri.png', // Verify this path
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi User 👋🏾",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text("Enjoy our services", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: "Home",
            activeIcon: Icon(IconlyBold.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.call),
            label: "Services",
            activeIcon: Icon(IconlyBold.call),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail_outlined),
            label: "Contact Us",
            activeIcon: Icon(Icons.contact_mail),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "About Us",
            activeIcon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
