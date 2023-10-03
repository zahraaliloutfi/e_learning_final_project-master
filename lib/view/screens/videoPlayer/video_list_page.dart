import 'package:e_learning_final_project/view/screens/videoPlayer/video_playback_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class VideoListPage extends StatelessWidget {
  final Reference storageRef = FirebaseStorage.instance.ref().child('videos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video List')),
      body: FutureBuilder<ListResult>(
        future: storageRef.listAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData || snapshot.data?.items == null || snapshot.data!.items.isEmpty) {
            return Text('No videos found.');
          }
          return ListView.builder(
            itemCount: snapshot.data!.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Video ${index + 1}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerPage(snapshot.data!.items[index]),
                      ),
                    );
                  },
                  child: Text('Play'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/uploadVideo');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
