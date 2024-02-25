import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05 * 2,
              color: Colors.green,
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.05 * 1.5 - 30,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1 + 20 * 6 + 7 - 15,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton(
                  context,
                  'assets/camera2.png',
                  'Camera',
                  'Camera',
                  const Color(0x003e77c2).withOpacity(0.93),
                  '/camera',
                  imageSize: const Size(320, 320),
                  verticalOffset: -12,
                  imageScale: 0.7, // Make the camera2.png smaller
                ),
                const SizedBox(height: 40),
                _buildButton(
                  context,
                  'assets/explore_nearby.png',
                  'Explore Nearby',
                  'Explore Nearby',
                  const Color(0x00a94040).withOpacity(0.93),
                  '/explore',
                  imageSize: const Size(360, 360),
                  imageScale: 0.95,
                  verticalOffset: -23,
                ),
                const SizedBox(height: 40),
                _buildButton(
                  context,
                  'assets/delivery.png',
                  'Waste Collection',
                  'Waste Collection',
                  const Color(0x00f7ef2a).withOpacity(0.93),
                  '/waste',
                  imageSize: const Size(1500, 1500),
                  textColor: Colors.black,
                  imageScale: 2,
                  verticalOffset: -70,// Make the delivery.png bigger
                ),
                const SizedBox(height: 40),
                _buildButton(
                  context,
                  'assets/houses.png',
                  'Community',
                  'Community',
                  const Color(0x0082b66a).withOpacity(0.57),
                  '/community',
                  imageSize: const Size(650, 650),
                  textColor: Colors.black,
                    imageScale: 1.3,
                    verticalOffset: -30
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String iconPath, String text, String semanticLabel, Color color, String route, {Color textColor = Colors.white, required Size imageSize, double verticalOffset = 0, double? imageScale}) {
    double buttonHeight = MediaQuery.of(context).size.height * 0.12;
    double imageHeight = (buttonHeight * 0.9) * (imageScale ?? 1); // Set image height to 90% of button height and scale it
    double textHeight = buttonHeight * 0.1;

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: verticalOffset + textHeight,
              left: 0,
              right: 0,
              child: SizedBox(
                height: imageHeight,
                child: Image.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  height: imageHeight,
                  width: imageHeight * (imageSize.width / imageSize.height),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}