import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: HexColor("#2B2F33"),
        child: Row(
      children: [
        IconButton(
          iconSize: 40.0,
          icon: SvgPicture.asset(
            "assets/option.svg",
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 7,
        ),
        Center(
          child: Text(
            "Quản lý thiết bị",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 6,
        ),
        PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SvgPicture.asset(
                  "assets/coolicon.svg",
                )),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.qr_code),
                        Text(
                          "Quét mã QR",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20.0),
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "Nhâp thủ công",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 16.0),
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.wifi),
                        Text(
                          "Quét trong LAN",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20.0),
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                ]),
        SizedBox(
          width: MediaQuery.of(context).size.width / 30,
        ),
      ],
    ));
  }
}
