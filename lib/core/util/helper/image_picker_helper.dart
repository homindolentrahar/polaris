import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  late ImagePicker _imagePicker;

  static ImagePickerHelper instance = ImagePickerHelper._();

  ImagePickerHelper._() {
    _imagePicker = ImagePicker();
  }

  Future<XFile?> openCamera() async {
    return _imagePicker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> openGallery() async {
    return _imagePicker.pickImage(source: ImageSource.gallery);
  }
}
