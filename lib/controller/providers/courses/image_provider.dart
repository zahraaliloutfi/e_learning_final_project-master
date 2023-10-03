import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  XFile? _image;

  final ImagePicker picker = ImagePicker();

  updateImage(var img) {
    _image = img;
    notifyListeners();
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    updateImage(img);
    notifyListeners();
  }
}
