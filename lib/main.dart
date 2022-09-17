import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LaunchPad',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'LaunchPad',
              style: GoogleFonts.orbitron(
                  fontWeight: FontWeight.w500, fontSize: 38),
            ),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '1.mp3'),
                const Pad(Color(0xffff2525), Color(0xffc40050), '2.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '3.mp3'),
                const Pad(Color(0xffE247FC), Color(0xffA23Ab7), '4.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '5.mp3'),
                const Pad(Color(0xffff2525), Color(0xffc40050), '6.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '7.mp3'),
                const Pad(Color(0xffE247FC), Color(0xffA23Ab7), '8.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '9.mp3'),
                const Pad(Color(0xffff2525), Color(0xffc40050), '10.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '11.mp3'),
                const Pad(Color(0xffE247FC), Color(0xffA23Ab7), '12.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '13.mp3'),
                const Pad(Color(0xffff2525), Color(0xffc40050), '14.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '15.mp3'),
                const Pad(Color(0xffE247FC), Color(0xffA23Ab7), '16.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '17.mp3'),
                const Pad(Color(0xffff2525), Color(0xffc40050), '18.mp3'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '19.mp3'),
                const Pad(Color(0xffE247FC), Color(0xffA23Ab7), '20.wav'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '21.mp3'),
                const Pad(Color(0xffff2525), Color(0xffc40050), '22.wav'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '23.wav'),
                const Pad(Color(0xffE247FC), Color(0xffA23Ab7), '24.wav'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '25.wav'),
                const Pad(Color(0xffff2525), Color(0xffc40050), '26.wav'),
                const Pad(Color(0xffADCBFC), Color(0xff067CCB), '27.wav'),
                const Pad(Color(0xffE247FC), Color(0xffA23Ab7), '28.wav'),
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final colorCenter;
  final colorsOutline;
  final note;
  const Pad(this.colorCenter, this.colorsOutline, this.note, {super.key});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();
  @override
  void initState() {
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorsOutline;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
          player.play(
            AssetSource(widget.note),
          );
        });
        await Future.delayed(
          Duration(milliseconds: 500),
        );
        setState(() {
          _colorCenter = widget.colorCenter;
          _colorOutline = widget.colorsOutline;
        });
      },
      child: Container(
        height: (height / 8.4),
        width: (width / 4) - 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: RadialGradient(
            colors: [_colorCenter, _colorOutline],
            radius: 0.5,
          ),
          boxShadow: [
            BoxShadow(color: Colors.pinkAccent, blurRadius: 5),
          ],
        ),
      ),
    );
  }
}

// Container(
//                     width: 100,
//                     height: 100,
//                     decoration: const BoxDecoration(
//                       gradient: RadialGradient(
//                         colors: <Color>[
//                           Color(0xffADCBFC),
//                           Color(0xff067CCB),
//                         ],
//                       ),
//                     ),
//                   ),
