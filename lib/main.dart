import 'package:TvIran/channel.dart';
import 'package:flutter/material.dart';
import 'package:video_viewer/video_viewer.dart';

void main() {
  runApp(const TvIran());
}

class TvIran extends StatefulWidget {
  const TvIran({Key? key}) : super(key: key);

  @override
  _TvIranState createState() => _TvIranState();
}

class _TvIranState extends State<TvIran> {
  final VideoViewerController controller = VideoViewerController();

  List<Channel> listchannels = [
    Channel(
      icon: "assets/images/tv1.png",
      link: "https://cdn.telewebion.com/tv1/live/720p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/tv2.png",
      link: "https://cdn.telewebion.com/tv2/live/576p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/tv3.png",
      link: "https://cdn.telewebion.com/tv3/live/720p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/tv4.png",
      link: "https://cdn.telewebion.com/tv4/live/576p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/tv5.png",
      link: "https://cdn.telewebion.com/tehran/live/576p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/varzesh.png",
      link: "https://cdn.telewebion.com/varzesh/live/720p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/nasim.png",
      link: "https://cdn.telewebion.com/nasim/live/720p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/tamasha.png",
      link: "https://cdn.telewebion.com/hdtest/live/720p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/ifilm.png",
      link: "https://cdn.telewebion.com/ifilm/live/720p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/namayesh.png",
      link: "https://cdn.telewebion.com/namayesh/live/720p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/mostanad.png",
      link: "https://cdn.telewebion.com/mostanad/live/480p/index.m3u8",
    ),
    Channel(
      icon: "assets/images/pooya.png",
      link: "https://cdn.telewebion.com/pooya/live/720p/index.m3u8",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TvIran',
      home: Theme(
        data: ThemeData(fontFamily: "YekanBakh"),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color.fromARGB(255, 114, 202, 242)],
              )),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Actev Novin",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff1b6c77)),
                        ),
                        const Spacer(),
                        const Text(
                          "تلویزیون آنلاین",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff1b6c77)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/images/tv.png",
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: VideoViewer(
                        controller: controller,
                        style: VideoViewerStyle(
                            loading: const CircularProgressIndicator(
                          color: Colors.black,
                        )),
                        autoPlay: true,
                        source: {
                          "channel": VideoSource(
                            video: VideoPlayerController.network(
                                "https://cdn.telewebion.com/tv1/live/720p/index.m3u8"),
                          )
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "پخش زنده شبکه های ایران",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        color: Color(0xff1e84a5),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1 / 1,
                          ),
                          itemCount: listchannels.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    controller.pause();
                                    controller
                                        .changeSource(
                                            source: VideoSource(
                                              video:
                                                  VideoPlayerController.network(
                                                      listchannels[index]
                                                          .link!),
                                            ),
                                            name: "")
                                        .then((value) {
                                      controller.play();
                                    });
                                  });
                                },
                                child: Card(
                                  elevation: 5,
                                  color: const Color(0xff33a5ca),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      listchannels[index].icon!,
                                      width: 75,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
