
// class ImageTile extends StatelessWidget {
//   const ImageTile({
//     Key? key,
//     required this.index,
//     required this.width,
//     required this.height,
//   }) : super(key: key);

//   final int index;
//   final int width;
//   final int height;

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       'https://picsum.photos/$width/$height?random=$index',
//       width: width.toDouble(),
//       height: height.toDouble(),
//       fit: BoxFit.cover,
//     );
//   }
// }

// class ImageData {
//   int clicks;
//   double size;

//   ImageData({required this.clicks, required this.size});
// }

// const cellRed = Color(0xffc73232);
// const cellMustard = Color(0xffd7aa22);
// const cellGrey = Color(0xffcfd4e0);
// const cellBlue = Color(0xff1553be);
// const background = Color(0xff242830);
// List<ImageData> imageDataList = [];

// class ImageItem extends StatefulWidget {
//   final ImageData imageData;

//   const ImageItem({Key? key, required this.imageData}) : super(key: key);

//   @override
//   ImageItemState createState() => ImageItemState();
// }

// class ImageItemState extends State<ImageItem> {
//   late ImageData imageData;
//   double maxImageSize = 300.0; // Maximum size for the image

//   @override
//   void initState() {
//     super.initState();
//     imageData = widget.imageData;
//   }

//   void incrementClicks() {
//     setState(() {
//       imageData.clicks++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double imageSize = maxImageSize * (imageData.clicks / maxClicks());

//     return GestureDetector(
//       onTap: incrementClicks,
//       child: Container(
//         width: imageSize,
//         height: imageSize,
//         child: FittedBox(
//           fit: BoxFit.contain,
//           child: Placeholder(),
//         ),
//       ),
//     );
//   }

//   int maxClicks() {
//     return imageDataList.map((imageData) => imageData.clicks).reduce(max);
//   }
// }

// class ImageLayoutPage extends StatefulWidget {
//   const ImageLayoutPage({super.key});

//   @override
//   ImageLayoutPageState createState() => ImageLayoutPageState();
// }

// class ImageLayoutPageState extends State<ImageLayoutPage> {
//   double screenWidth = 0;
//   double maxImageSize = 0;

//   @override
//   void initState() {
//     super.initState();

//     // Generate random click counts for the images
//     final random = Random();
//     for (int i = 0; i < 10; i++) {
//       imageDataList.add(
//         ImageData(
//           clicks: random.nextInt(100),
//           size: 0,
//         ),
//       );
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     screenWidth = MediaQuery.of(context).size.width;

//     // Calculate the maximum image size based on the available screen width
//     maxImageSize = screenWidth / imageDataList.length.toDouble();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Sort the images based on the number of clicks in descending order
//     imageDataList.sort((a, b) => b.clicks.compareTo(a.clicks));

//     double totalClicks = imageDataList.fold(0, (sum, imageData) => sum + imageData.clicks);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic Image Layout'),
//       ),
//       body: Stack(
//         children: imageDataList.map((imageData) {
//           double imageSize = maxImageSize * (imageData.clicks / totalClicks);
//           return Positioned.fill(
//             child: Center(
//               child: ImageItem(imageData: imageData),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> images = [
    // "https://picsum.photos/500/600?random=2",
    // "https://picsum.photos/300/300?random=2",
    // "https://picsum.photos/200/400?random=2",
    // "https://picsum.photos/100/100?random=2",
    // "https://picsum.photos/100/100?random=2",
    // "https://picsum.photos/200/300?random=2",
    // "https://picsum.photos/200/200?random=1",
//     "https://picsum.photos/60/60?random=2"
//   ];
//   List<int> clickCounts = [];
//   double _imageWidth = 0.0;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the images and click counts.
//     // for (int i = 0; i < 10; i++) {
//     //   images.add(Placeholder());
//     //   clickCounts.add(Random().nextInt(100));
//     // }

//     // Initialize the image width.
//     _imageWidth = 100.0;

//     // Sort the images by click count.
//     clickCounts.sort((a, b) => b - a);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGrid.count(
//       crossAxisCount: 2, // Number of columns in the grid
//       mainAxisSpacing: 10.0, // Spacing between rows
//       crossAxisSpacing: 10.0, // Spacing between columns
//       staggeredTileBuilder: (int index) {
//         return StaggeredTile.count(1, 1); // Size of each tile (width: 1, height: 1)
//       },
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           color: Colors.grey[200],
//           width: 900, // Width of the container
//           height: 900, // Height of the container
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, // Number of images in each row of the grid
//               crossAxisSpacing: 10.0, // Spacing between image columns
//               mainAxisSpacing: 10.0, // Spacing between image rows
//             ),
//             itemCount: imageUrls.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Image.network(
//                 imageUrls[index], // Image URL
//                 fit: BoxFit.cover, // Fits the image within each grid cell
//               );
//             },
//           ),
//         );
//       },
//       itemCount: 1, // Number of tiles in the grid (1 box)
//     );
//   }
// }
// //  Scaffold(
// //         appBar: AppBar(
// //           title: Text('Dynamic Image Layout'),
// //         ),
// //         body: SizedBox(
// //           height: 900,
// //           child: GridView.custom(
// //             physics: NeverScrollableScrollPhysics(),
// //             gridDelegate: SliverQuiltedGridDelegate(
// //               crossAxisCount: 4,
// //               mainAxisSpacing: 4,
// //               crossAxisSpacing: 4,

// //               repeatPattern: QuiltedGridRepeatPattern.inverted,
// //               // pattern: []
// //               pattern: [
// //                 QuiltedGridTile(2, 3),
// //                 QuiltedGridTile(1, 1),
// //                 QuiltedGridTile(1, 1),
// //               ],
// //             ),
// //             childrenDelegate: SliverChildBuilderDelegate(
// //                 childCount: 12,
// //                 (context, index) => Image.network(
// //                       images[2],
// //                       fit: BoxFit.fitWidth,
// //                     )),
// //           ),
// //         )

// //  MasonryGridView.count(
// //             clipBehavior: Clip.antiAlias,
// //             crossAxisCount: 5,
// //             // mainAxisSpacing: 4,
// //             // crossAxisSpacing: 4,
// //             physics: NeverScrollableScrollPhysics(),
// //             itemCount: images.length,
//         // itemBuilder: (context, index) => Image.network(
//         //       images[index],
//         //       fit: BoxFit.fitWidth,
//         //     )),

// //         );
// //   }
// // }
