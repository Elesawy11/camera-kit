import 'package:camerakit_flutter/lens_model.dart';
import 'package:final_camera_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:camerakit_flutter/camerakit_flutter.dart';

class CameraKitScreen extends StatefulWidget {
  const CameraKitScreen({super.key});

  @override
  _CameraKitScreenState createState() => _CameraKitScreenState();
}

class _CameraKitScreenState extends State<CameraKitScreen>
    implements CameraKitFlutterEvents {
  late final CameraKitFlutterImpl _cameraKitFlutterImpl;
  // List<String> _lenses = [];

  @override
  void initState() {
    super.initState();

    // Initialize CameraKitFlutterImpl after the widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cameraKitFlutterImpl =
          CameraKitFlutterImpl(cameraKitFlutterEvents: this);
      // _cameraKitFlutterImpl.openCameraKit(
      //   groupIds: Constants.groupIdList,
      //   isHideCloseButton: false,
      // );
      // _loadLenses();
    });
    
  }

  // @override
  // void dispose() {
  //   // Clean up resources
  //   // _cameraKitFlutterImpl.c;
  //   super.dispose();
  // }

  // Load lenses for the given group IDs
  // void _loadLenses() async {
  //   try {
  //     final lenses = await _cameraKitFlutterImpl.getLenses(groupIds: Constants.groupIdList);
  //     setState(() {
  //       _lenses = lenses;
  //     });
  //   } catch (e) {
  //     print("Failed to load lenses: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Kit Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Constants.groupIdList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Constants.groupIdList[index]),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _cameraKitFlutterImpl.openCameraKit(
                groupIds: Constants.groupIdList,
                isHideCloseButton: false,
              );
            },
            child: Text('Open Camera Kit'),
          ),
        ],
      ),
    );
  }

  // Implement CameraKitFlutterEvents methods
  @override
  void onCameraKitClosed() {
    print("Camera Kit closed");
  }

  @override
  void onCameraKitLensApplied(String lensId) {
    print("Lens applied: $lensId");
  }

  @override
  void onCameraKitLensError(String error) {
    print("Lens error: $error");
  }

  @override
  void onCameraKitSnapTaken(String imagePath) {
    print("Snap taken: $imagePath");
  }

  @override
  void onCameraKitSnapTakenFailed(String error) {
    print("Snap failed: $error");
  }

  @override
  void onCameraKitLoaded() {
    print("Camera Kit loaded");
  }

  @override
  void onCameraKitShown() {
    print("Camera Kit shown");
  }

  @override
  void onCameraKitResult(Map result) {
    // TODO: implement onCameraKitResult
  }

  @override
  void receivedLenses(List<Lens> lensList) {
    // TODO: implement receivedLenses
  }
}

// class Constants {
//   static const List<String> groupIdList = [
//     'YOUR_LENS_GROUP_ID_1', // Replace with your Lens Group IDs
//     'YOUR_LENS_GROUP_ID_2',
//   ];
// }
