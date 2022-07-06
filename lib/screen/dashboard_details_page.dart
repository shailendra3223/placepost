import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:digitalmaster/preferance/PrefsConst.dart';
import 'package:digitalmaster/preferance/pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class DashBoardDetailsPage extends StatefulWidget {
  dynamic motivationasseturl;

  DashBoardDetailsPage({Key? key, this.motivationasseturl}) : super(key: key);

  @override
  State<DashBoardDetailsPage> createState() => _DashBoardDetailsPageState();
}

class _DashBoardDetailsPageState extends State<DashBoardDetailsPage> {
  Color selectedColor = Colors.white;
  ScreenshotController _screenshotController = ScreenshotController();

  Color textColor = Colors.black;
  bool select = true;
  int index = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterDownloader.registerCallback(downloadCallback);
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    // if (debug) {
    //   print(
    //       'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    // }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Preview Page",
            style: TextStyle(color: Colors.white),
          )),
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  setState(() {
                    index++;
                  });
                  await _screenshotController
                      .capture(delay: const Duration(milliseconds: 10))
                      .then((image) async {
                    if (image != null) {
                      //final imagePath = await File('${directory?.path}/image.png').create();
                      final imagePath = await File(
                              "/storage/emulated/0/Download/P&P ${"image" +
                                  index.toString()}.png")
                          .create();
                      await imagePath.writeAsBytes(image);
                      Get.snackbar("Success", "Downloaded Successfully",
                          backgroundColor: Colors.white,
                          colorText: Colors.black);
                      final status = await Permission.storage.request();

                      if (status.isGranted) {
                        final externalDir = await getExternalStorageDirectory();
                        final id = await FlutterDownloader.enqueue(
                          url: "https:/" + imagePath.path,
                          savedDir: externalDir!.path,
                          fileName: "download",
                          showNotification: false,
                          openFileFromNotification: false,
                        );
                      } else {
                        print("Permission deined");
                      }

                      /// Share Plugin
                    }
                  });
                },
                icon: const Icon(Icons.download)),
          ],
          backgroundColor: const Color(0xff022334),
        ),
        body: ListView(
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 388,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.motivationasseturl)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                    child: Prefs.getString(
                                                PrefsConst.PROFILEPATH) !=
                                            null
                                        ? Image.file(File(Prefs.getString(
                                            PrefsConst.PROFILEPATH)!))
                                        : Image.network(
                                            "https://www.freeiconspng.com/uploads/nike-logo-png-shoes-brand-17.png")),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 5),
                              child: Container(
                                  width: 315,
                                  child: select
                                      ? Card(
                                          color: selectedColor,
                                          elevation: 0.8,
                                          semanticContainer: true,
                                          shadowColor: Colors.transparent,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: CoachingDetails(
                                            selectedColor: textColor,
                                          ),
                                        )
                                      : CoachingDetails(
                                          selectedColor: textColor,
                                        )),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, left: 10, right: 10),
                        child: select
                            ? Card(
                                color: selectedColor,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: ContactDetails(
                                  selectedColor: textColor,
                                ))
                            : ContactDetails(
                                selectedColor: textColor,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Text(
                      "Variation",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            select = true;
                            selectedColor = Colors.black;
                            textColor = Colors.white;
                          });
                          // Get.to(()=>StartQuizPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade400,
                          ),
                          child: Center(
                              child: Container(
                            color: Colors.black,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Try this",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            select = true;
                            selectedColor = Colors.white;
                            textColor = Colors.black;
                          });
                          // Get.to(()=>const StartGamePage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade400,
                          ),
                          child: Center(
                              child: Container(
                            color: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Try this",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            select = false;
                            selectedColor = Colors.transparent;
                            textColor = Colors.black;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade400,
                          ),
                          child: const Center(
                              child: Text(
                            "Try this",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            select = false;
                            selectedColor = Colors.transparent;
                            textColor = Colors.white;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade400,
                          ),
                          child: const Center(
                              child: Text(
                            "Try this",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          )),
                        ),
                      ),
                    ],
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10)),
              ),
            ),
          ],
        ));
  }
}

class CoachingDetails extends StatelessWidget {
  const CoachingDetails({Key? key, required this.selectedColor})
      : super(key: key);

  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 0),
          child: Text(
            Prefs.getString(PrefsConst.NAME) ?? "Classes Name",
            style: TextStyle(
                color: selectedColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 0),
          child: Text(
            Prefs.getString(PrefsConst.ADDRESS) ?? "Your Address",
            style: TextStyle(color: selectedColor, fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key, required this.selectedColor})
      : super(key: key);
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center(
        child: Text(
          'Contact Number : ${Prefs.getString(PrefsConst.MOBILE) ??
              "9769859062/9769859062"}',
          style: TextStyle(color: selectedColor, fontSize: 16),
        ),
      ),
    );
  }
}
