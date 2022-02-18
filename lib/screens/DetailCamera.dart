import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/screens/nav_screen.dart';
import 'package:flutter_youtube_ui/widgets/custome_app_bar_detail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoCardDetail extends StatefulWidget {
  final Video video;
  final bool hasPadding;
  final VoidCallback? onTap;
  final String URLVLc;
  final int index;

  const VideoCardDetail({
    Key? key,
    required this.video,
    this.hasPadding = false,
    this.onTap,
    required this.URLVLc,
    required this.index,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Cardvideo();
  }
}

class Cardvideo extends State<VideoCardDetail> {
  late VlcPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      widget.URLVLc,
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#2B2F33"),
          title: CustomSliverAppBarDetail(),
        ),
        body: GestureDetector(
            onTap: () {
              context.read(selectedVideoProvider).state = widget.video;
              context
                  .read(miniPlayerControllerProvider)
                  .state
                  .animateToHeight(state: PanelState.MAX);
              // if (onTap != null) onTap!();
            },
            child: Column(children: [
              Container(
                  // height: MediaQuery.of(context).size.height / 2.5,
                  color: HexColor("#2B2F33"),
                  child: Card(
                    color: HexColor("#2B2F33"),
                    margin:
                        EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 2),
                    elevation: 10,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                                child: VlcPlayer(
                              controller: _videoPlayerController,
                              aspectRatio: 16 / 10,
                              placeholder:
                                  Center(child: CircularProgressIndicator()),
                            )),
                            Align(
                              alignment: Alignment.center,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: () {
                                  if (_videoPlayerController.value.isPlaying) {
                                    _videoPlayerController.pause();
                                  } else {
                                    // If the video is paused, play it.
                                    _videoPlayerController.play();
                                  }
                                },
                                child: Icon(
                                  _videoPlayerController.value.isPlaying
                                      ? Icons.play_arrow
                                      : Icons.pause,
                                ),
                              ),
                            )
                            // This trailing comma makes auto-formatting nicer for build methods.
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Flexible(
                                    Text(
                                      widget.video.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child:
                                    Icon(Icons.volume_up_outlined, size: 25.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        HexColor("#404447"),
                        HexColor("#555A5E"),
                        HexColor("#404447"),
                      ],
                    ),
                    shape: BoxShape.circle),
                child: Container(
                    child: Column(
                  children: [
                    Align(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_up_sharp),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          // alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_left_sharp),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.all(10),
                          height: 90,
                          width: 90,
                          child: SvgPicture.asset("assets/Group6375.svg"),
                        ),
                        Align(
                          // alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_right_sharp),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      // alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                      ),
                    ),
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 10,
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/-.svg")),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 9,
                  ),
                  IconButton(
                      iconSize: 10,
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/+.svg")),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Container(
                      color: HexColor("#404447"),
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              iconSize: 10,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/Delete.svg")),
                          IconButton(
                              iconSize: 50,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/Hd.svg")),
                          IconButton(
                              iconSize: 50,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/Setting.svg")),
                          IconButton(
                              iconSize: 50,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/fullcreen.svg"))
                        ],
                      ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 2, top: 1),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              iconSize: 60,
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/CamreaDetail.svg",
                              )),
                          IconButton(
                              iconSize: 60,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/Cature.svg")),
                          IconButton(
                              iconSize: 60,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/ptz.svg")),
                          IconButton(
                              iconSize: 60,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/Volume.svg")),
                          IconButton(
                              iconSize: 60,
                              onPressed: () {},
                              icon: SvgPicture.asset("assets/Creen1.svg"))
                        ],
                      )))
            ])));
  }
}
