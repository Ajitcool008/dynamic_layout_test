import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ImageData {
  final int clicks;
  final double initialSize;
  double size;
  final String imageUrl;

  ImageData({
    required this.clicks,
    required this.initialSize,
    required this.size,
    required this.imageUrl,
  });

  ImageData copyWith({
    int? clicks,
    double? initialSize,
    double? size,
    String? imageUrl,
  }) {
    return ImageData(
      clicks: clicks ?? this.clicks,
      initialSize: initialSize ?? this.initialSize,
      size: size ?? this.size,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

class DynamicImageLayout extends StatefulWidget {
  final List<int> clickCounts;
  final List<String> imageUrls;

  const DynamicImageLayout(this.clickCounts, this.imageUrls, {super.key});

  @override
  DynamicImageLayoutState createState() => DynamicImageLayoutState();
}

class DynamicImageLayoutState extends State<DynamicImageLayout> {
  late List<ImageData> imageList;

  @override
  void initState() {
    super.initState();
    _initializeImages();
  }

  void _initializeImages() {
    final maxClicks = widget.clickCounts.reduce(max);
    final minClicks = widget.clickCounts.reduce(min);

    imageList = widget.clickCounts
        .asMap()
        .map((index, clicks) => MapEntry(
              index,
              ImageData(
                clicks: clicks,
                initialSize: 50.0, // Initial size of the image (you can adjust this value as per your need)
                size: (clicks - minClicks) / (maxClicks - minClicks) * 100.0 + 50.0,
                imageUrl: widget.imageUrls[index], // Provide the image URL for the corresponding index
              ),
            ))
        .values
        .toList();
  }

  void _onImageTap(int index) {
    setState(() {
      final maxClicks = widget.clickCounts.reduce(max);
      final minClicks = widget.clickCounts.reduce(min);

      imageList = imageList
          .asMap()
          .map((i, imageData) => MapEntry(
                i,
                (i == index)
                    ? imageData.copyWith(size: imageData.size + 20.0) // Increase size of the tapped image
                    : imageData.copyWith(
                        size: (imageData.clicks - minClicks) / (maxClicks - minClicks) * 100.0 + 50.0,
                      ),
              ))
          .values
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          children: imageList.map((imageData) {
            return GestureDetector(
              onTap: () => _onImageTap(imageList.indexOf(imageData)),
              child: Image.network(
                // Use Image.network for remote URLs or Image.asset for local asset paths
                imageData.imageUrl,
                width: imageData.size,
                height: imageData.size,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dynamic Image Layout')),
        body: Center(
          child: Container(
            color: Colors.grey[300], // Set the background color of the container
            padding: const EdgeInsets.all(20.0),
            child: const DynamicImageLayout(
              [10, 15, 5, 20, 1, 24, 2, 10, 9, 4], // Click counts for each image
              [
                "https://picsum.photos/500/600?random=2",
                "https://picsum.photos/300/300?random=2",
                "https://picsum.photos/200/400?random=2",
                "https://picsum.photos/100/100?random=2",
                "https://picsum.photos/100/100?random=2",
                "https://picsum.photos/200/300?random=2",
                "https://picsum.photos/200/200?random=1",
                "https://picsum.photos/200/200?random=6",
                "https://picsum.photos/200/200?random=4",
                "https://picsum.photos/200/200?random=3"
              ],
            ),
          ),
        ),
      ),
    );
  }
}
