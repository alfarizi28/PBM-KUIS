import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class pageDua extends StatefulWidget {
  const pageDua({Key? key}) : super(key: key);

  @override
  State<pageDua> createState() => secondPageState();
}

// ignore: camel_case_types
class secondPageState extends State<pageDua> {
  int maxduration = 100;
  int currentpos = 0;
  String textHolder = "Speed: Normal";
  double speed = 1;
  String currentpostlabel = "00:00";
  String maxdurationlabel = "00:00";
  String audioasset = "audio/malinkundang.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes = await rootBundle.load(audioasset);
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

      player.onDurationChanged.listen((Duration d) {
        maxduration = d.inMilliseconds;

        int mhours = Duration(milliseconds: maxduration).inHours;
        int mminutes = Duration(milliseconds: maxduration).inMinutes;
        int mseconds = Duration(milliseconds: maxduration).inSeconds;

        int hhours = mhours;
        int hminutes = mminutes - (mhours * 60);
        int hseconds = mseconds - (mminutes * 60 + mhours * 60 * 60);

        maxdurationlabel = "$hhours:$hminutes:$hseconds";

        setState(() {});
      });

      player.onAudioPositionChanged.listen((Duration p) {
        currentpos = p.inMilliseconds;

        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    Container container2;
    container2 = Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.6,
          ),
          Text(
            textHolder,
            style: const TextStyle(color: Colors.black),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              currentpostlabel,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
            Slider(
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              value: double.parse(currentpos.toString()),
              min: 0,
              max: double.parse(maxduration.toString()),
              divisions: maxduration,
              label: currentpostlabel,
              onChanged: (double value) async {
                int seekval = value.round();
                int result = await player.seek(Duration(milliseconds: seekval));
                if (result == 1) {
                  currentpos = seekval;
                } else {
                  print("Seek Unsuccessful.");
                }
              },
            ),
            Text(
              maxdurationlabel,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ]),
          SizedBox(
            height: height * 0.05,
          ),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: const CircleBorder(),
                      fixedSize: const Size(80, 70)),
                  onPressed: () {
                    if (speed > 1 && speed <= 2) {
                      player.setPlaybackRate(1.0);
                      speed = speed / 2;
                      setState(() {
                        textHolder = "Speed: Normal";
                      });
                    } else if (speed > 2 && speed <= 4) {
                      player.setPlaybackRate(1.5);
                      speed = speed / 2;
                      setState(() {
                        textHolder = "Speed: $speed" + "X";
                      });
                    } else if (speed == 1) {
                      player.setPlaybackRate(0.5);
                      speed = 1 / 2;
                      setState(() {
                        textHolder = "Speed: 0.5X";
                      });
                    } else if (speed <= 0.5) {
                      // ignore: avoid_print
                      print("Minimum Speed");
                      setState(() {
                        textHolder = "Speed: 0.5X";
                      });
                    }
                  },
                  child: const Icon(
                    Icons.fast_rewind,
                    size: 48,
                    color: Colors.black,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: const CircleBorder(),
                      fixedSize: const Size(70, 70)),
                  onPressed: () async {
                    if (!isplaying && !audioplayed) {
                      int result = await player.playBytes(audiobytes);
                      if (result == 1) {
                        //play success
                        setState(() {
                          isplaying = true;
                          audioplayed = true;
                        });
                      } else {
                        // ignore: avoid_print
                        print("Error while playing audio.");
                      }
                    } else if (audioplayed && !isplaying) {
                      int result = await player.resume();
                      if (result == 1) {
                        //resume success
                        setState(() {
                          isplaying = true;
                          audioplayed = true;
                        });
                      } else {
                        // ignore: avoid_print
                        print("Error on resume audio.");
                      }
                    } else {
                      int result = await player.pause();
                      if (result == 1) {
                        //pause success
                        setState(() {
                          isplaying = false;
                        });
                      } else {
                        // ignore: avoid_print
                        print("Error on pause audio.");
                      }
                    }
                  },
                  child: Icon(
                    isplaying ? Icons.pause : Icons.play_arrow,
                    size: 38,
                    color: const Color(0xffffffff),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: const CircleBorder(),
                      fixedSize: const Size(80, 70)),
                  onPressed: () {
                    if (speed < 2 && speed > 0.5) {
                      player.setPlaybackRate(1.5);
                      speed = speed * 2;
                      setState(() {
                        textHolder = "Speed: $speed" + "X";
                      });
                    } else if (speed < 4 && speed >= 2) {
                      player.setPlaybackRate(2.0);
                      speed = speed * 2;
                      setState(() {
                        textHolder = "Speed: $speed" + "X";
                      });
                    } else if (speed == 0.5) {
                      player.setPlaybackRate(1.0);
                      speed = speed * 2;
                      setState(() {
                        textHolder = "Speed: Normal";
                      });
                    } else if (speed >= 4) {
                      // ignore: avoid_print
                      print("Maximum Speed");
                    }
                  },
                  child: const Icon(
                    Icons.fast_forward,
                    size: 46,
                    color: Colors.black,
                  )),
            ],
          ),
        ],
      ),
    );
    var container = container2;
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg2.png"), fit: BoxFit.cover),
          ),
        ),
        container
      ]),
    );
  }
}
