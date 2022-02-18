import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/screens/DetailCamera.dart';
import 'package:flutter_youtube_ui/screens/nav_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:page_transition/page_transition.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoCard extends StatefulWidget {
  final Video video;
  final bool hasPadding;
  final VoidCallback? onTap;
  final String  URLVLc;
  final int index;

  const VideoCard({
    Key? key,
    required this.video,
    this.hasPadding = false,
    this.onTap,
    required this.URLVLc, required this.index,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Cardvideo();
  }
}
class Cardvideo extends State<VideoCard> {
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
    return GestureDetector(
        onTap: () {
          context
              .read(selectedVideoProvider)
              .state = widget.video;
          context
              .read(miniPlayerControllerProvider)
              .state
              .animateToHeight(state: PanelState.MAX);
          // if (onTap != null) onTap!();
        },
        child: Card(
          color: HexColor("#2B2F33"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.only(left: 3, right: 3, top: 5),
          elevation: 10,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.hasPadding ? 12.0 : 0,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:  Radius.circular(15)),
                        child:VlcPlayer(
                          controller: _videoPlayerController,
                          aspectRatio: 16 /10,
                          placeholder: Center(child: CircularProgressIndicator()),
                        ))
                  ),
                  AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Align(
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
                      ))
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
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(
                                    milliseconds: 200),
                                reverseDuration: Duration(
                                    milliseconds: 200),
                                child: VideoCardDetail(
                                  video: videos[widget.index],
                                  URLVLc: videos[widget.index].thumbnailUrl,
                                  index: widget.index,

                                )));

                      },
                      child:
                      Icon(Icons.remove_red_eye_outlined, size: 20.0),
                    ),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.settings, size: 20.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

}

