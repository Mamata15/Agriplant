import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color.fromARGB(255, 117, 175, 101),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/services/Aboutus.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay (optional)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Content
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const CircleAvatar(
                    radius: 60,
                    foregroundImage: NetworkImage(
                      'https://webstockreview.net/images/agriculture-clipart-agriculture-logo-8.png',
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "About Agriplant",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Agriplant is a comprehensive app developed by Quantum Paradigm. Our goal is to provide farmers with innovative solutions to manage their agricultural needs efficiently. From farm management to crop monitoring and supply chain logistics, Agriplant offers a suite of tools designed to enhance productivity and streamline operations.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'About Quantum Paradigm',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Quantum Paradigm is a technology company based in Bangalore. We specialize in developing advanced solutions tailored to the needs of various industries. Our mission is to harness technology to create impactful and efficient tools that drive progress and innovation.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Contact Information:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Address: Bangalore', 
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Phone: 6362833454', 
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Email: mamata0410@gmail.com', 
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              // Optional: Add links or additional information here if needed
            ],
          ),
        ],
      ),
    );
  }
}
