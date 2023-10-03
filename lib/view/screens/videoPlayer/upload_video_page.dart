import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadVideoPage extends StatelessWidget {
  final TextEditingController _linkController = TextEditingController();

  Future<void> _uploadVideo(BuildContext context) async {
    final String videoLink = _linkController.text;
    final Reference storageRef = FirebaseStorage.instance.ref().child('videos').child(DateTime.now().toString());

    // Upload video link to Firebase Storage
    await storageRef.putString(videoLink);

    // Navigate back to the video list page
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Video')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _linkController,
              decoration: InputDecoration(labelText: 'Enter Video Link'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _uploadVideo(context),
              child: Text('Upload Video'),
            ),
          ],
        ),
      ),
    );
  }
}
