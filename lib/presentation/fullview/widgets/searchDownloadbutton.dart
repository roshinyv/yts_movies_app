import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/domain/search/model/data.dart';

class SearchDownloadButton extends StatefulWidget {
  final Torrent torrentData;
  const SearchDownloadButton({
    Key? key,
    required this.torrentData,
  }) : super(key: key);

  @override
  State<SearchDownloadButton> createState() => _SearchDownloadButtonState();
}

class _SearchDownloadButtonState extends State<SearchDownloadButton> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  void _download(String url) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final externalDir = await getExternalStorageDirectory();

      final id = await FlutterDownloader.enqueue(
        url: url,
        savedDir: externalDir!.path,
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      print('Permission Denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('=================downbutton');
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.download,
                    color: Colors.green,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.torrentData.quality.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Colors.green)))),
              onPressed: () async {
                print('==========torrentUrl============' +
                    widget.torrentData.url.toString());
                _download(widget.torrentData.url.toString());
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 100,
            child: textRow(
                txt: 'Quality :', torrentData: widget.torrentData.quality!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 100,
            child:
                textRow(txt: 'Type :', torrentData: widget.torrentData.type!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 100,
            child:
                textRow(txt: 'Size :', torrentData: widget.torrentData.size!),
          ),
        ),
      ],
    );
  }

  Row textRow({required String txt, required String torrentData}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          txt,
          style: TextStyle(
            color: kGoldenColor,
          ),
        ),
        Text(
          torrentData,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
