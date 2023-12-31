import 'dart:io';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:pictotalk/api/TextRecognitionApi.dart';

class CameraWidgetForTextToImage extends StatefulWidget {
  final CameraController controller;

  const CameraWidgetForTextToImage({super.key, required this.controller});

  @override
  State<CameraWidgetForTextToImage> createState() =>
      _CameraWidgetForTextToImageState();
}

class _CameraWidgetForTextToImageState
    extends State<CameraWidgetForTextToImage> {
  String? shownText;

  FlutterTts flutterTts = FlutterTts();

  @override
  void dispose() {
    flutterTts.stop();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(widget.controller)),
        Positioned(
          bottom: 50,
          child: FloatingActionButton(
            onPressed: () async {
              final image = await widget.controller.takePicture();
              final recognizedText = await TextRecognitionApi.recogonizeText(
                InputImage.fromFile(
                  File(image.path),
                ),
              );

              shownText = recognizedText;

              if (shownText != null) {
                List<dynamic> voices = await flutterTts.getVoices;
                for (dynamic voice in voices) {
                  print("Voice name: ${voice['name']}");

                  print("Voice identifier: ${voice['voiceId']}");

                  print("Language: ${voice['language']}");

                  print("Country: ${voice['country']}");

                  print("");
                }

                await flutterTts.setVoice({
                  'name': voices[7]['name'],
                  'locale': voices[7]['locale'],
                });

                flutterTts.speak(shownText.toString());
              }

              setState(() {});
            },
            child: const Icon(Icons.camera),
          ),
        ),
        if (shownText != null)
          GestureDetector(
            onTap: () {
              setState(() {
                shownText = null;

                flutterTts.stop();
              });
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(30)),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          shownText!.replaceAll('\n', " "),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
