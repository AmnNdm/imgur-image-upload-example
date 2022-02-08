import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imgur_image_upload/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  final _imagepicker = ImagePicker();
  RxString picture = "".obs;
  RxList idList = [].obs;

  pickimagefromgallery() async {
    if (!await Permission.storage.isGranted) {
      await Permission.storage.request();
      return;
    }
    final pickedFile = await _imagepicker.pickImage(
        source: ImageSource.gallery, imageQuality: 25);

    if (pickedFile == null) {
      print('user cancelled the image selection');
      return;
    } else {
      uploadImage(File(pickedFile.path));
    }
  }

  uploadImage(File image) async {
    var request =
        http.MultipartRequest(Constants().post, Uri.parse(Constants().url));
    request.headers["Authorization"] = Constants().clientID;
    var file = await http.MultipartFile.fromPath(
      "image",
      image.path,
    );
    request.files.add(file);
    var response = await request.send();
    var result = await http.Response.fromStream(response)
        .then((value) => jsonDecode(value.body));
    var data = result["data"];
    idList.add(data["id"]);
    print(data);
  }

  getImage(int index) async {
    // url of images saved on imgur is based on their IDs i.e. imgur's url + image id + .jpeg
    var newurl = Constants().baseurl + idList[index] + Constants().ext;
    picture.value = newurl;
    print(picture);
    // var request = await http.get(Uri.parse(newurl));
    // var result = jsonDecode(request.body);
    // var data = request.body;
  }
}
