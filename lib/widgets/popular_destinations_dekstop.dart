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
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.png',
    'assets/images/7.png',
    'assets/images/6.png',
    'assets/images/11.png',
    'assets/images/12.png',
    'assets/images/9.png',
    'assets/images/10.png',
  ];

  int _currentPage = 0;

  final List<bool> _isHoveredList = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final textSize = isSmallScreen ? 22.0 : 28.0;

    int startIndex = _currentPage * 4;
    int endIndex = startIndex + 4;
    List<String> currentImages = _imagePaths.sublist(
      startIndex,
      endIndex > _imagePaths.length ? _imagePaths.length : endIndex,
    );

    return Container(
      // color: Colors.amber,
      height: screenWidth * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_right),
                    onPressed: endIndex < _imagePaths.length
                        ? () {
                            setState(() {
                              _currentPage++;
                            });
                          }
                        : null,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: Container(
              // color: Colors.black,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(currentImages.length, (index) {
                  return MouseRegion(
                    onEnter: (_) => setState(
                        () => _isHoveredList[startIndex + index] = true),
                    onExit: (_) => setState(
                        () => _isHoveredList[startIndex + index] = false),
                    child: AnimatedContainer(
                      width: screenWidth * 0.22,
                      margin: EdgeInsets.all(screenWidth * 0.0022),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(currentImages[index]),
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
                        border: _isHoveredList[startIndex + index]
                            ? Border.all(width: 3, color: Colors.red)
                            : null,
                      ),
                      duration: const Duration(milliseconds: 200),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: screenWidth * 0.18,
                            height: screenWidth * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: const Center(
                              child: Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
