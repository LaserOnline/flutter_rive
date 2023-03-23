import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rive/rive.dart';

enum ImageStatus { doge, batman }

enum ImagePokemon { Bullbasaur, Meowth, Pikachu, Swords }

class PageRive01 extends StatefulWidget {
  const PageRive01({Key? key}) : super(key: key);

  @override
  State<PageRive01> createState() => _PageRive01();
}

class _PageRive01 extends State<PageRive01> {
  double _imageWidth = 45.0;
  double _imageHeight = 45.0;
  String Doge = "assets/image/Doge.png";
  String Batman = "assets/image/Batman_Emoji.png";
  String Bullbasaur = "assets/image/bullbasaur.png";
  String Meowth = "assets/image/meowth.png";
  String Pikachu = "assets/image/pikachu.png";
  String Swords = "assets/image/swords.png";
  ImageStatus _imageStatus = ImageStatus.doge;
  ImagePokemon _ImagePokemon = ImagePokemon.Pikachu;

  void chagePokemon() async {
    setState(() {
      if (_ImagePokemon == ImagePokemon.Pikachu) {
        _ImagePokemon = ImagePokemon.Meowth;
        print("Bullbasaur");
      } else if (_ImagePokemon == ImagePokemon.Meowth) {
        _ImagePokemon = ImagePokemon.Bullbasaur;
        print("Pikachu");
      } else {
        _ImagePokemon = ImagePokemon.Pikachu;
        print("Meowth");
      }
    });
  }

  void chageImage1() {
    setState(() {
      _imageHeight = 150.0;
      if (_imageStatus == ImageStatus.doge) {
        _imageStatus = ImageStatus.batman;
        print("Batman");
      } else {
        _imageStatus = ImageStatus.doge;
        print("doge");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Animeation 01"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          const RiveAnimation.asset(
            "assets/animation/Beastoid.riv",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: width * 0.0097,
            right: width * 0.0097,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: height * 0.095,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      chageImage1();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: getImageWidget(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      Swords,
                      width: _imageWidth,
                      height: _imageHeight,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      chagePokemon();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: getImagePokemon(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getImageWidget() {
    if (_imageStatus == ImageStatus.doge) {
      return Image.asset(
        Doge,
        width: _imageWidth,
        height: _imageHeight,
      );
    } else {
      return Image.asset(
        Batman,
        width: _imageWidth,
        height: _imageHeight,
      );
    }
  }

  Widget getImagePokemon() {
    if (_ImagePokemon == ImagePokemon.Pikachu) {
      return Image.asset(
        Meowth,
        width: _imageWidth,
        height: _imageHeight,
      );
    } else if (_ImagePokemon == ImagePokemon.Meowth) {
      return Image.asset(
        Bullbasaur,
        width: _imageWidth,
        height: _imageHeight,
      );
    } else {
      return Image.asset(
        Pikachu,
        width: _imageWidth,
        height: _imageHeight,
      );
    }
  }
}
