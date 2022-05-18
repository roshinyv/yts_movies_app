import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yts_app/core/colors/constant_colors.dart';
import 'package:yts_app/domain/core/api_endpoints.dart';
import 'package:yts_app/domain/home/model/data.dart';
import 'package:yts_app/domain/home/model/torrent.dart';
import 'package:yts_app/presentation/fullview/widgets/downloadbutton.dart';
import 'package:yts_app/presentation/widgets/main_titles.dart';

class FullDetailView extends StatelessWidget {
  final Movie dataList;
  const FullDetailView({Key? key, required this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ytId = dataList.ytTrailerCode.toString();
    print('============ytid========' + ytId);
    DateTime date = DateTime.parse(dataList.dateUploaded!.toString());
    final uploadedDate = DateFormat('dd-MMM-yyy').format(date);
    String durationToString(int minutes) {
      var d = Duration(minutes: minutes);
      List<String> parts = d.toString().split(':');
      return '${parts[0].padLeft(2, '')} hr ${parts[1].padLeft(2, '0')} min';
    }

    final movieRuntime = durationToString(dataList.runtime!.toInt());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ).createShader(
                          Rect.fromLTRB(100, 480, rect.width, rect.height * 1));
                    },
                    blendMode: BlendMode.darken,
                    child: CachedNetworkImage(
                      imageUrl: dataList.largeCoverImage.toString(),
                      placeholder: (context, url) => const SizedBox(
                        height: 500,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => const SizedBox(
                        height: 500,
                        child: Center(
                          child: Icon(
                            Icons.error,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dataList.title!,
                          style: const TextStyle(
                              color: kWhiteColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 23,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    dataList.year.toString(),
                    style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    dataList.genres
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', '')
                        .replaceAll(',', ' /'),
                    style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child:
                                    Image.asset('assets/images/imdb_logo.png'),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                dataList.rating!.toString(),
                                style: const TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                dataList.id!.toString(),
                                style: const TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Synopsis',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    dataList.synopsis!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              children: const [
                CustomTitles(
                  title: 'Trailer',
                  txtColor: kWhiteColor,
                  txtSize: 18,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: <Widget>[
                SizedBox(
                  height: 180,
                  width: 400,
                  child: CachedNetworkImage(
                    imageUrl: dataList.backgroundImageOriginal!.toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: IconButton(
                          icon: const Icon(
                            Icons.play_circle_outline,
                            size: 80,
                            color: Colors.white70,
                          ),
                          onPressed: () async {
                            if (await launchUrl(
                                Uri.parse(ApiEndPoints.ytUrl + ytId))) {
                              debugPrint('success');
                              print(ApiEndPoints.ytUrl + ytId.toString());
                            } else {
                              debugPrint('fail');
                            }
                            print('play button');
                          }),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Container(
                        height: 200,
                        child: const Icon(
                          Icons.error,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ]),
            ),
            const CustomTitles(
              title: 'Download',
              txtColor: kWhiteColor,
              txtSize: 18,
            ),
            GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: dataList.torrents!.length,
              itemBuilder: (context, index) {
                return DownloadButton(
                  torrentData: dataList.torrents![index],
                );
              },
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Runtime : ',
                        style: TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        movieRuntime,
                        style: const TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Uploaded Date : ',
                        style: TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        uploadedDate,
                        style: const TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
