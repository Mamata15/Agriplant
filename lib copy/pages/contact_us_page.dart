import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/services/background.png',
              fit: BoxFit.cover, // Ensure the image covers the entire background
            ),
          ),
          // Gradient overlay (Optional: If you want a gradient overlay)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change text color to white
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Agriplant app helps in efficient farm management, crop monitoring, and supply chain logistics. Connect with us to know more.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change text color to white
                  ),
                ),
                SizedBox(height: 20),
                ContactInfo(
                  icon: Icons.location_on,
                  text: 'Quantum Paradigm, Bangalore',
                ),
                ContactInfo(
                  icon: Icons.web,
                  text: 'www.quantumparadigm12.in',
                ),
                ContactInfo(
                  icon: Icons.email,
                  text: 'mamta@quantumparadigm.in',
                ),
                ContactInfo(
                  icon: Icons.phone,
                  text: '6362833454',
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Thank You',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Footer(), // Add Footer widget here
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white, // Change icon color to white
            size: 24,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Change text color to white
            ),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      // Removed background color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Align the content at the bottom
        children: [
          Text(
            'Follow Us On',
            style: TextStyle(fontSize: 15.0, color: Colors.white,), // Updated text color
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _launchGoogleURL();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchInstagramURL();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    color:  Colors.white,
                    size: 30,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchFacebookURL();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchXURL();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  child: Icon(
                    FontAwesomeIcons.xTwitter, // Using Twitter icon as the X symbol
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchInstagramURL() async {
    const url = 'https://www.instagram.com/';
    try {
      await launch(url);
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  void _launchFacebookURL() async {
    const url = 'https://www.facebook.com/';
    try {
      await launch(url);
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  void _launchXURL() async {
    const url = 'https://twitter.com/'; // Updated to X
    try {
      await launch(url);
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  void _launchGoogleURL() async {
    const url = 'https://www.google.com/';
    try {
      await launch(url);
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
