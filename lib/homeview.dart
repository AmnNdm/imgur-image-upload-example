import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homecontroller.dart';

class MyHomePage extends GetView<HomeController> {
  MyHomePage({Key? key, required this.title}) : super(key: key) {
    Get.put(HomeController());
  }
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () async {
                print("button pressed");
                controller.pickimagefromgallery();
              },
              child: const Text(
                "Upload Image",
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
          ObxValue((RxString rxString) {
            return Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
                child: rxString.value.isEmpty
                    ? null
                    : Image.network(
                        rxString.value,
                        fit: BoxFit.contain,
                      ));
          }, controller.picture),
          ObxValue((RxList rxList) {
            return SizedBox(
              height: 200,
              child: rxList.isEmpty
                  ? null
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: rxList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          visualDensity: VisualDensity.compact,
                          leading: Text("${index + 1}."),
                          title: Text(rxList[index]),
                          onTap: () {
                            controller.getImage(index);
                          },
                        );
                      }),
            );
          }, controller.idList),
        ],
      ),
    );
  }
}
