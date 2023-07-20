// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_wall_layout/flutter_wall_layout.dart';
// import 'package:flutter_wall_layout/wall_builder.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wall Layout Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         backgroundColor: Color(0xFFF5F5F5),
//       ),
//       home: MyHomePage(title: 'Wall Layout Demo'),
//     );
//   }
// }

// class ImageData {
//   final int clicks;
//   final Color color;
//   final int width;
//   final int height;

//   ImageData({
//     required this.clicks,
//     required this.color,
//     required this.height,
//     required this.width,
//   });

//   factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
//         clicks: json["click"],
//         color: json["color"],
//         width: json["width"],
//         height: json["height"],
//       );
//   ImageData copyWith({int? clicks, Color? color, int? width, int? height}) {
//     return ImageData(
//       clicks: clicks ?? this.clicks,
//       color: color ?? this.color,
//       width: width ?? this.width,
//       height: height ?? this.height,
//     );
//   }
// }

// //TODO it is working I can use this but need some more corrections

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   late final AnimationController _controller;
//   late bool _reversed;
//   late Axis _direction;
//   late int _nbLayers;
//   late bool _wrapedOptions;
//   List<ImageData> imageData = [];
//   // bool _random = false;
//   late List<Stone> _stones;
//   final List<int> clickCounts = [1, 2, 3, 2, 1, 3, 4, 2, 1, 2, 3, 1, 2, 1, 2, 1, 3];
//   final dataa = [
//     {"color": Colors.red, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.greenAccent, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.lightBlue, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.purple, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.yellow, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.cyanAccent, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.orange, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.green, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.pink, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.blueAccent, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.amber, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.teal, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.lightGreenAccent, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.deepOrange, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.deepPurpleAccent, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.lightBlueAccent, "click": 0, "width": 1, "height": 1},
//     {"color": Colors.limeAccent, "click": 0, "width": 1, "height": 1},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     imageData = List<ImageData>.from(dataa.map((x) => ImageData.fromJson(x)));
//     _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
//     _reversed = false;
//     _direction = Axis.vertical;
//     _nbLayers = 5;
//     _controller.forward(from: 0);
//     _wrapedOptions = true;
//     _stones = _buildStonesList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final backgroundColor = Theme.of(context).backgroundColor;
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         title: Text(this.widget.title),
//       ),
//       body: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: buildWallLayout()),
//       // floatingActionButton: _buildOptions(context),
//     );
//   }

//   // void _onRandomClicked() {
//   //   setState(() {
//   //     _random = !_random;
//   //     if (_random) {
//   //       _stones = _buildRandomStonesList(_nbLayers);
//   //     } else {
//   //       _stones = _buildStonesList();
//   //     }
//   //   });
//   // }

//   // Widget _buildOptions(BuildContext context) {
//   //   return AnimatedSize(
//   //     duration: Duration(milliseconds: 200),
//   //     reverseDuration: Duration(milliseconds: 200),
//   //     alignment: Alignment.bottomRight,
//   //     // vsync: this,
//   //     child: Container(
//   //       margin: EdgeInsets.only(left: 32),
//   //       decoration: BoxDecoration(
//   //         color: Theme.of(context).backgroundColor,
//   //         boxShadow: [
//   //           BoxShadow(color: Colors.black26, blurRadius: 6.0),
//   //         ],
//   //         borderRadius: BorderRadius.circular(30.0),
//   //       ),
//   //       child: Column(
//   //         mainAxisSize: MainAxisSize.min,
//   //         crossAxisAlignment: CrossAxisAlignment.end,
//   //         children: [
//   //           if (!_wrapedOptions)
//   //             Padding(
//   //               padding: EdgeInsets.symmetric(vertical: 20.0),
//   //               child: Column(
//   //                 mainAxisSize: MainAxisSize.min,
//   //                 crossAxisAlignment: CrossAxisAlignment.end,
//   //                 children: [
//   //                   // __buildDivisionsOption(),
//   //                   // __buildDirectionOption(),
//   //                   // __buildReverseOption(),
//   //                 ],
//   //               ),
//   //             ),
//   //           FloatingActionButton(
//   //             elevation: 0.0,
//   //             highlightElevation: 0.0,
//   //             onPressed: () => setState(() => _wrapedOptions = !_wrapedOptions),
//   //             child: Icon(Icons.build),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget __buildDivisionsOption() {
//   //   return _buildOption(
//   //     "Layers",
//   //     CupertinoSegmentedControl<int>(
//   //       groupValue: _nbLayers,
//   //       children: {2: Text("2"), 3: Text("3"), 4: Text("4")},
//   //       onValueChanged: (value) => setState(() {
//   //         _controller.forward(from: 0.0);
//   //         _nbLayers = value;
//   //         if (_random) {
//   //           _stones = _buildRandomStonesList(_nbLayers);
//   //         }
//   //       }),
//   //     ),
//   //   );
//   // }

//   // Widget __buildReverseOption() {
//   //   return _buildOption(
//   //     "Reverse",
//   //     CupertinoSegmentedControl<bool>(
//   //       groupValue: _reversed,
//   //       children: {false: Text("no"), true: Text("yes")},
//   //       onValueChanged: (value) => setState(() {
//   //         _controller.forward(from: 0.0);
//   //         _reversed = value;
//   //       }),
//   //     ),
//   //   );
//   // }

//   // Widget __buildDirectionOption() {
//   //   return _buildOption(
//   //     "Direction",
//   //     CupertinoSegmentedControl<Axis>(
//   //       groupValue: _direction,
//   //       children: {Axis.vertical: Text("vertical"), Axis.horizontal: Text("horizontal")},
//   //       onValueChanged: (value) => setState(() {
//   //         _controller.forward(from: 0.0);
//   //         _direction = value;
//   //       }),
//   //     ),
//   //   );
//   // }

//   Widget _buildOption(String text, Widget child) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 4.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Flexible(
//             child: Text(text),
//             flex: 1,
//           ),
//           Expanded(
//             child: child,
//             flex: 2,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildWallLayout() {
//     return WallLayout(
//       // physics: NeverScrollableScrollPhysics(),
//       wallBuilder:
//           //  _random
//           // ?
//           //     FillingHolesWallBuildHandler(
//           //   context: context,
//           //   childBuilder: (_) => DecoratedBox(
//           //     decoration: BoxDecoration(color: Color(0xffececee), borderRadius: BorderRadius.circular(12)),
//           //   ),
//           // ),
//           //     :
//           WallBuilder.standard(),
//       scrollDirection: _direction,
//       stones: _stones,
//       reverse: _reversed,
//       layersCount: _nbLayers,
//     );
//   }

//   List<Stone> _buildRandomStonesList(int maxLayer) {
//     Random r = Random();
//     final next = () => r.nextInt(maxLayer) + 1;
//     final colors = [
//       Colors.red,
//       Colors.greenAccent,
//       Colors.lightBlue,
//       Colors.purple,
//       Colors.yellow,
//       Colors.cyanAccent,
//       Colors.orange,
//       // Colors.green,
//       // Colors.pink,
//       // Colors.blueAccent,
//       // Colors.amber,
//       // Colors.teal,
//       // Colors.lightGreenAccent,
//       // Colors.deepOrange,
//       // Colors.deepPurpleAccent,
//       // Colors.lightBlueAccent,
//       // Colors.limeAccent,
//     ];
//     return imageData.map((d) {
//       int width = next();
//       int height = next();
//       return Stone(
//         id: imageData.indexOf(d),
//         width: width,
//         height: height,
//         child: __buildStoneChild(
//           data: d,
//           background: d.color,
//           text: "${width}x$height",
//           surface: (width * height).toDouble(),
//         ),
//       );
//     }).toList();
//   }

//   List<Stone> _buildStonesList() {
//     return imageData.map((d) {
//       int width = d.width;
//       int height = d.height;
//       return Stone(
//         id: imageData.indexOf(d),
//         width: height > 5 ? 5 : height,
//         height: height > 5 ? 5 : height,
//         child: __buildStoneChild(
//           data: d,
//           background: d.color,
//           text: "$height",
//           surface: (height * height).toDouble(),
//         ),
//       );
//     }).toList();
//   }

//   void onImageTap({required int image}) {
//     final maxClicks = clickCounts.reduce(max);
//     final minClicks = clickCounts.reduce(min);
//     clickCounts[image] = clickCounts[image]++;
//     print(maxClicks);
//     print(minClicks);
//     // final index = imageData.indexWhere((img) => img.color == image.color);

//     // int clicksForImage1 = 50; // Replace with the actual click count of the specific image you want to resize.

// // Calculate the scaling factor based on the formula.
//     // double scalingFactor = ((clicksForImage1 - minClicks) / (maxClicks - minClicks) * 100.0 + 50.0);

// // Now, you can resize other images using the calculated scaling factor.
// // For example, if you have an image widget, you can set its width and height like this:
//     // double originalImageWidth = 200.0; // Replace with the actual width of the original image.
//     // double originalImageHeight = 150.0; // Replace with the actual height of the original image.

//     // double resizedWidth = 1 * (scalingFactor / 100.0);
//     // double resizedHeight = 1 * (scalingFactor / 100.0);
//     // int clickVal = imageData[index].clicks + 1;
//     // int height = imageData[index].height + 1;
//     // int width = imageData[index].width + 1;
//     // imageData[index] = ImageData(clicks: clickVal, color: imageData[index].color, height: height, width: width);

//     imageData = imageData
//         .asMap()
//         .map((i, imageDa) => MapEntry(
//               i,
//               (i == image)
//                   ? imageDa.copyWith(height: imageDa.height + 1) // Increase size of the tapped image
//                   : imageDa.copyWith(
//                       height: imageDa.height == 1
//                           ? imageDa.height
//                           : maxClicks > imageData.length
//                               ? imageDa.height >= 2
//                                   ? imageDa.height - 1
//                                   : imageDa.height
//                               : imageDa.height
//                       //((((imageData.clicks - minClicks) / (maxClicks - minClicks) * 100.0 + 50.0) /100,)*1)
//                       ),
//             ))
//         .values
//         .toList();

//     _stones = _buildStonesList();
//     setState(() {});
//   }

//   Widget __buildStoneChild(
//       {required ImageData data, required Color background, required String text, required double surface}) {
//     return ScaleTransition(
//       scale: CurveTween(curve: Interval(0.0, min(1.0, 0.25 + surface / 6.0))).animate(_controller),
//       child: InkWell(
//         onTap: () => onImageTap(image: imageData.indexWhere((element) => element.color == data.color)),
//         child: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [background, Color.alphaBlend(background.withOpacity(0.6), Colors.black)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Text(text, style: TextStyle(color: Colors.white, fontSize: 32.0)),
//         ),
//       ),
//     );
//   }
// }

// // Fill empty place with stone 1x1
// class FillingHolesWallBuildHandler extends WallBuilder {
//   final WallBuilder proxy = WallBuilder.standard();
//   final BuildContext context;
//   final WidgetBuilder childBuilder;

//   FillingHolesWallBuildHandler({required this.childBuilder, required this.context}) : super();

//   WallBlueprint _buildBlueprint(List<Stone> stones) {
//     return proxy.build(
//         mainAxisSeparations: mainAxisSeparations, reverse: reverse, direction: direction, stones: stones);
//   }

//   void _findHoles(WallBlueprint blueprint, Function(int x, int y) onHoleFound) {
//     List<Rect> bounds = blueprint.stonesPosition
//         .map((key, value) => MapEntry(
//             key, Rect.fromLTWH(value.x.toDouble(), value.y.toDouble(), key.width.toDouble(), key.height.toDouble())))
//         .values
//         .toList();
//     for (int x = 0; x < blueprint.size.width; x++) {
//       for (int y = 0; y < blueprint.size.height; y++) {
//         Rect area = Rect.fromLTWH(x.toDouble(), y.toDouble(), 1.0, 1.0);
//         bounds.firstWhere(
//           (element) => area.overlaps(element),
//           orElse: () {
//             onHoleFound(x, y);
//             return area;
//           },
//         );
//         bounds.add(area);
//       }
//     }
//   }

//   @override
//   Map<Stone, StoneStartPosition> computeStonePositions(List<Stone> stones) {
//     final blueprint = _buildBlueprint(stones);
//     Map<Stone, StoneStartPosition> positions = blueprint.stonesPosition;
//     int idStart = 10000;
//     _findHoles(blueprint, (x, y) {
//       final stone = Stone(
//         height: 1,
//         width: 1,
//         id: idStart++,
//         child: childBuilder.call(context),
//       );
//       positions[stone] = StoneStartPosition(x: x, y: y);
//     });
//     return positions;
//   }
// }
