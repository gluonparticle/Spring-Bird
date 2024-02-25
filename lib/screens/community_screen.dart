import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // Define variables to store the positions of the rectangles
  double rectangle1Top = 230 + 130 + 10;
  double rectangle2Top = 230 + 130 + 10;
  double rectangle3Top = 230 + 130 + 10;
  double rectangleLeft = 0;

  // Define a variable to store the vertical offset for the back button
  double backButtonOffset = 20;

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
            top: 35, // Adjust the top position based on the offset
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          // Add the transparent box
          Positioned(
            top: 230, // Center vertically
            left: MediaQuery.of(context).size.width / 2 - 250, // Center horizontally
            child: Container(
              width: 9800, // Editable size
              height: 130, // Editable size
              decoration: BoxDecoration(
                color: Color(0x62628E37), // Color with 62% transparency
              ),
            ),
          ),
          // Add the rectangles
          Positioned(
            top: 400, // Below the transparent box with spacing
            left: 110, // Center horizontally
            child: GestureDetector(
              // Gesture detector for drag functionality
              onPanUpdate: (details) {
                setState(() {
                  // Update the top position of Rectangle 1
                  rectangle1Top += details.delta.dy;
                });
              },
              child: Container(
                width: 200,
                height: 75,
                color: Color(0xFF2B41B7), // 50% transparency
                child: Center(
                  child: Text(
                    'DONATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Remaining code for rectangles...

          Positioned(
            top: 400, // Below the transparent box with spacing
            left: 110, // Center horizontally
            child: GestureDetector(
              // Gesture detector for drag functionality
              onPanUpdate: (details) {
                setState(() {
                  // Update the top position of Rectangle 1
                  rectangle1Top += details.delta.dy;
                });
              },
              child: Container(
                width: 200,
                height: 75,
                color: Color(0xFF2B41B7), // 50% transparency
                child: Center(
                  child: Text(
                    'DONATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 545, // Below the transparent box with spacing
            left: 20, // Center horizontally
            child: GestureDetector(
              // Gesture detector for drag functionality
              onPanUpdate: (details) {
                setState(() {
                  // Update the top position of Rectangle 2
                  rectangle2Top += details.delta.dy;
                });
              },
              child: Container(
                width: 370,
                height: 80,
                color: Color(0x80F7BEBE), // 50% transparency
                child: Center(
                  child: Text(
                    'Uploading an item:        +50',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 645, // Below the transparent box with spacing
            left: 20, // Center horizontally
            child: GestureDetector(
              // Gesture detector for drag functionality
              onPanUpdate: (details) {
                setState(() {
                  // Update the top position of Rectangle 3
                  rectangle3Top += details.delta.dy;
                });
              },
              child: Container(
                width: 370,
                height: 80,
                color: Color(0x80F7BEBE),

                child: Center(
                  child: Text(
                    'Recycling:    +100 to +1000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 745, // Below the transparent box with spacing
            left: 20, // Center horizontally
            child: GestureDetector(
              // Gesture detector for drag functionality
              onPanUpdate: (details) {
                setState(() {
                  // Update the top position of Rectangle 4
                  rectangle3Top += details.delta.dy;
                });
              },
              child: Container(
                width: 370,
                height: 80,
                color: Color(0x80F7BEBE),
                child: Center(
                  child: Text(
                    'Shopowners:             +500',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 295, // Adjust position based on your layout
            left: MediaQuery.of(context).size.width / 2 - 200, // Center horizontally
            child: Text(
              'This is how points are calculated',
              style: TextStyle(
                color: Colors.black, // White color
                fontSize: 26, // Font size
                fontWeight: FontWeight.bold, // Bold font weight
              ),
              textAlign: TextAlign.center,
              // Center aligned
            ),
          ),
          // Add the brown circle
          Positioned(
            top: 180, // Center vertically
            left: MediaQuery.of(context).size.width / 2 - 50, // Center horizontally
            child: Container(
              width: 100, // Editable size
              height: 100, // Editable size
              decoration: BoxDecoration(
                color: Colors.brown,
                // Brown color
                shape: BoxShape.circle,
                // Circular shape
              ),
              child: Center(
                child: Text(
                  '5420',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
