import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/courses/image_provider.dart';
import '../../global/utill/colors.dart';
import '../../global/utill/custom_fonts.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key,required this.ctx});
  final BuildContext ctx;
  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    void myAlert() {
      showDialog(
          context: widget.ctx,
          builder: (BuildContext context) {
            return Consumer<ImagePickerProvider>(
                builder: (context, imageProvider, child) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: const Text('Please choose media to select'),
                    content: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: ()  {
                              Navigator.pop(context);
                              imageProvider.getImage(ImageSource.gallery);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.image),
                                Text('From Gallery'),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              imageProvider.getImage(ImageSource.camera);

                            },
                            child: Row(
                              children: [
                                Icon(Icons.camera),
                                Text('From Camera'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              'Upload Course Cover',
              style: TajwalRegular.copyWith(
                color: ColorResources.kPrimaryColorblack,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              myAlert();
            },
            icon: const Icon(
              Icons.image,
              color: Colors.blue,
              size: 30,
            ))
      ],
    );
  }
}
