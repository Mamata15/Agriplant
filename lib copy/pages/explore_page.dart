import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriplant/models/product.dart';
import 'package:agriplant/data/products.dart';
import 'package:agriplant/widgets/product_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String? selectedCategory;
  List<Product> filteredProducts = products;
  final TextEditingController _searchController = TextEditingController();

  void filterProducts(String? category) {
    setState(() {
      selectedCategory = category;
      if (category == null || category.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products.where((product) => product.category == category).toList();
      }
    });
  }

  void searchProducts(String query) {
    setState(() {
      filteredProducts = products.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  Future<void> showFilterDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Category"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("All"),
                onTap: () {
                  filterProducts(null);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Machines"),
                onTap: () {
                  filterProducts("Machines");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Fruits"),
                onTap: () {
                  filterProducts("Fruits");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Gardening Machine"),
                onTap: () {
                  filterProducts("Gardening Machine");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Seeds"),
                onTap: () {
                  filterProducts("Seeds");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Vegetables"),
                onTap: () {
                  filterProducts("Vegetables");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Animals"),
                onTap: () {
                  filterProducts("Animals");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search and Filter section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) => searchProducts(value),
                          decoration: InputDecoration(
                            hintText: "Search here...",
                            isDense: true,
                            contentPadding: const EdgeInsets.all(12.0),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.all(
                                Radius.circular(99),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(99),
                              ),
                            ),
                            prefixIcon: const Icon(IconlyLight.search),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: IconButton.filled(
                          onPressed: showFilterDialog,
                          icon: const Icon(IconlyLight.filter),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: SizedBox(
                    height: 160, // Adjust height as needed
                    child: Card(
                      color: Colors.green.shade50,
                      elevation: 0.1,
                      shadowColor: Colors.green.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Free consultation",
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          color: Colors.green.shade700,
                                        ),
                                  ),
                                  const Text("Get free support from our customer service"),
                                  FilledButton(
                                    onPressed: () {
                                      _makePhoneCall('9902776021');
                                    },
                                    child: const Text("Call now"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120, // Adjust width as needed
                              child: Image.asset(
                                'assets/contact_us.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Products",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("See all"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // GridView section with scrolling enabled
          Expanded(
            child: GridView.builder(
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
