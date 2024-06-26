import 'package:flutter/material.dart';
import 'package:learn/utils.dart';
import 'package:learn/components.dart';


class PhotoProfile extends StatefulWidget {
  final TextEditingController photoPathController;
  final VoidCallback onPhotoChanged;

  const PhotoProfile({
    required this.photoPathController,
    required this.onPhotoChanged,
    super.key,
  });

  @override
  _PhotoProfileState createState() => _PhotoProfileState();
}

class _PhotoProfileState extends State<PhotoProfile> {
  late String selectedPhoto;

  @override
  void initState() {
    super.initState();
    selectedPhoto = widget.photoPathController.text;
  }

  void _changePhoto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 54,),
                  SizedBox(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    'Biblioteca de ícones',
                    style: CoinnyTextStyles.h5_medium(color: CoinnyColors.textDarkPurple, fontSize: 23),
                  ),
                  const SizedBox(height: 10),
                   Text(
                    'Escolha um ícone que mais representa o seu dependente!',
                    style: CoinnyTextStyles.body_2_medium(color: CoinnyColors.suportTextGrey),
                  ),
                  ],)),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildImages(
                          context, 'assets/images/profiles/ball.png', setState),
                      _buildImages(
                          context, 'assets/images/profiles/bear.png', setState),
                      _buildImages(
                          context, 'assets/images/profiles/cube.png', setState),
                      _buildImages(
                          context, 'assets/images/profiles/game.png', setState),
                      _buildImages(
                          context, 'assets/images/profiles/robot.png', setState),
                      _buildImages(
                          context, 'assets/images/profiles/unicorn.png', setState),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CoinnyGradientButton(
                    onPressed: () {
                      widget.photoPathController.text = selectedPhoto;
                      widget.onPhotoChanged();
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    title: "SALVAR",
                    color: selectedPhoto.isEmpty ? const Color(0xFF848484) : const Color(0xff5D61D6),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildImages(BuildContext context, String imagePath, StateSetter setState) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPhoto = imagePath;
        });
      },
      child: Container(
        width: 104.0,
        height: 104.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.83),
          border: Border.all(
            color: const Color(0xFFFFE061)
                .withOpacity(selectedPhoto == imagePath ? 1 : 0),
            width: 2.0,
          ),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 104,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 128.0,
          height: 128.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFC7C7C7),
              width: 1.0,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: ClipOval(
              child: Image.asset(
                widget.photoPathController.text.isEmpty ? 'assets/images/profiles/default.png' : widget.photoPathController.text,
                width: 104,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: IconButton(
              icon: Image.asset("assets/images/appIcons/camera.png"),
              onPressed: () {
                _changePhoto(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
