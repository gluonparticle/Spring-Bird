import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> with SingleTickerProviderStateMixin {
  int _currentImageIndex = 0;
  final List<String> _images = ['assets/source0.jpg', 'assets/source1.jpg', 'assets/source2.jpg'];
  final List<Offset> _imageOffsets = [Offset(0, -135), Offset(0, -135), Offset(0, 180)]; // Specify offsets for each image
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showBubbles = false;

  void _nextImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _images.length;
    });
    _showBubbles = false; // Hide bubbles when changing images
  }

  void _captureImage() {
    setState(() {
      _showBubbles = !_showBubbles;
    });
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBubblesForImage(int index) {
    List<BubbleData> bubbles = _getBubblesForImage(index);

    return AnimatedOpacity(
      opacity: _showBubbles ? 0.65 : 0.0,
      duration: Duration(milliseconds: 700),
      child: Stack(
        children: bubbles.map((bubble) {
          return Positioned(
            left: bubble.position.dx,
            top: bubble.position.dy,
            child: GestureDetector(
              onTap: () {
                _showFeedbackWindow(bubble.label, bubble.plasticPercentage);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.90),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white, width: 4), // Add white outline
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<BubbleData> _getBubblesForImage(int index) {
    switch (index) {
      case 0:
        return _showBubbles
            ? [
          BubbleData(Offset(300, 200), 'Sustainable', 17.3),
          BubbleData(Offset(50, 150), 'Non-Sustainable', 100),
          BubbleData(Offset(110, 270), 'Non-Sustainable', 100),
          BubbleData(Offset(50, 400), 'Mildly Sustainable', 31.6),
        ]
            : [];
      case 1:
        return _showBubbles
            ? [
          BubbleData(Offset(90, 80), 'Non-Sustainable', 100),
          BubbleData(Offset(65, 220), 'Non-Sustainable', 100),
          BubbleData(Offset(90, 400), 'Non-Sustainable', 100),
          BubbleData(Offset(300, 150), 'Non-Sustainable', 100),
          BubbleData(Offset(320, 300), 'Non-Sustainable', 100),
        ]
            : [];
      case 2:
        return _showBubbles ? [BubbleData(Offset(180, 335), 'Sustainable', 0)] : []; // Adjust the offset for the bubbles
      default:
        return [];
    }
  }


  void _showFeedbackWindow(String label, double plasticPercentage) {
    String feedbackText = '';
    double fontSize = 18;
    if (label == 'Non-Sustainable') {
      feedbackText = 'This product isn\'t eco-friendly. Consider greener alternatives and remember to recycle.';
      fontSize = 26;
    } else if (label == 'Mildly Sustainable') {
      feedbackText = 'Good start! This product is somewhat sustainable. Aim for even greener options.';
      fontSize = 26;
    } else if (label == 'Sustainable') {
      feedbackText = 'Excellent! This product is eco-friendly. Keep making such sustainable choices.';
      fontSize = 26;
    }

    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Plastic Percentage: ${plasticPercentage.toString()}%',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(height: 10),
              Text(
                feedbackText,
                style: TextStyle(fontSize: fontSize),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.black,
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: _imageOffsets[_currentImageIndex].dx,
                  top: _imageOffsets[_currentImageIndex].dy,
                  child: Image.asset(
                    _images[_currentImageIndex],
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: _animation.value),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    );
                  },
                ),
                _buildBubblesForImage(_currentImageIndex),
              ],
            ),
          ),
          Container(
            height: 150,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _captureImage();
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500), // Adjust the duration of the animation
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _showBubbles ? Colors.lightBlue.withOpacity(0.5) : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _nextImage,
                    icon: Icon(Icons.refresh),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BubbleData {
  final Offset position;
  final String label;
  final double plasticPercentage;

  BubbleData(this.position, this.label, this.plasticPercentage);
}
