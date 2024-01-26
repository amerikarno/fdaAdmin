import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class ImageUtil {
  Future<Size?> getImageSize(String imagePath) async {
    ByteData data = await rootBundle.load(imagePath);
    List<int> bytes = data.buffer.asUint8List();
    img.Image? image = img.decodeImage(Uint8List.fromList(bytes));
    if (image != null) {
      return Size(image.width.toDouble(), image.height.toDouble());
    } else {
      return null;
    }
  }
}
