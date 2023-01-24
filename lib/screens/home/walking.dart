import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in/app.dart';
import '../../controller/open_camera.dart';
import '../../main.dart';
import '../../ui/main_page.dart';

List<CameraDescription>? _camera;
Future<void> initCamera() async {
  _camera = await availableCameras();
  runApp(ProviderScope(child: MainPage()));
}

class WalkingScreen extends StatefulWidget {
  @override
  State<WalkingScreen> createState() => _WalkingScreenState();
}

class _WalkingScreenState extends State<WalkingScreen> {
  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.cyan,
                    Colors.purple,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 50,
                bottom: 50,
              ),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    "Walking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OpenCamera(
                          cameras: _camera!,
                        ),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 200,
                      height: 200,
                      child: const Icon(
                        Icons.camera_alt,
                        size: 150,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const Text(
                    "Let's Start!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    DateTime.now().toString().substring(0, 10),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Walking extends StatefulWidget {
//   const Walking({Key? key}) : super(key: key);

//   @override
//   State<Walking> createState() => _WalkingState();
// }

// class _WalkingState extends State<Walking> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Progress'),
//         backgroundColor: Color.fromARGB(255, 61, 25, 67),
//         centerTitle: true,
//       ),
//     );
//   }
// }
