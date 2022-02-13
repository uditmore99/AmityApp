// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
//   late AnimationController _breathingController;
//   var _breathe =0.0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _breathingController = AnimationController(
//         vsync: this, duration: Duration(seconds: 4));
//     _breathingController.addStatusListener((status) {
//       if(status == AnimationStatus.completed){
//         _breathingController.reverse();
//
//       } else if (status == AnimationStatus.dismissed){
//         _breathingController.forward();
//       }
//     });
//
//     _breathingController.addListener(() {
//       setState(() {
//         _breathe =_breathingController.value;
//       });
//     });
//     _breathingController.forward();
//
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//      var size = 170.0 -120.0 * _breathe;
//
//      // changeColor(){
//      //   color: Colors.red;
//      //   size = 0.0;
//      // }
//     return Scaffold(
//       body:Center(
//         child: Column(
//           children: [
//             Container(
//               height: size,
//               width:size,
//               child: Material(
//                 borderRadius: BorderRadius.circular(size),
//                 color: Colors.blueAccent,
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: size,
//                 width: size,
//                 child: ElevatedButton(onPressed: (){
//                   setState(() {
//                     // changeColor();
//
//                   });
//                 },
//                     child: Text('Press me now123!')
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//
//   }
//
//
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(VideoDemo());
}
class VideoDemo extends StatelessWidget {
  const VideoDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VideoDemo(),
    );
  }
}


class VideoDemo extends StatefulWidget {
  VideoDemo() : super();

  final String title = "Video Demo";

  @override
  VideoDemoState createState() => VideoDemoState();
}

class VideoDemoState extends State<VideoDemo> {
  //
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(
        // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    _controller = VideoPlayerController.asset("videos/breathing.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Demo"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
        Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}