import 'package:flutter/material.dart';

class PopularDestinationsDesktop extends StatefulWidget {
  final double screenSizeWidth;

  const PopularDestinationsDesktop({super.key, required this.screenSizeWidth});

  @override
  _PopularDestinationsDesktopState createState() =>
      _PopularDestinationsDesktopState();
}

class _PopularDestinationsDesktopState
    extends State<PopularDestinationsDesktop> {
  final List<String> _imagePaths = [
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
    'assets/images/6.png',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final textSize = isSmallScreen ? 22.0 : 28.0;

    // Calculate the start and end index for the current page
    int startIndex = _currentPage * 4;
    int endIndex = startIndex + 4;
    List<String> currentImages = _imagePaths.sublist(
      startIndex,
      endIndex > _imagePaths.length ? _imagePaths.length : endIndex,
    );

    return Container(
      color: Colors.amber,
      height: screenWidth * 0.3,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular destinations",
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_left),
                    onPressed: _currentPage > 0
                        ? () {
                            setState(() {
                              _currentPage--;
                            });
                          }
                        : null, // Disable button if on the first page
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_right),
                    onPressed: endIndex < _imagePaths.length
                        ? () {
                            setState(() {
                              _currentPage++;
                            });
                          }
                        : null, // Disable button if on the last page
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // Constrain GridView with a SizedBox
          SizedBox(
            height:
                screenWidth * 0.3, // or any other formula that fits your design
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: currentImages.map((imagePath) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
