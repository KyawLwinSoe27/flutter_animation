import 'package:flutter/material.dart';

import 'explicit_animation_favourite_icon_button.dart';

const kAnimationDuration = Duration(milliseconds: 500);

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isChangeBackgroundColor = false;
  bool isNewDimension = true;
  bool isShowDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: kAnimationDuration,
            color: (isChangeBackgroundColor) ? Colors.black : Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      AnimatedContainer(
                        duration: kAnimationDuration,
                        width: (isNewDimension) ? 350 : 250,
                        height: (isNewDimension) ? 300 : 200,
                        curve: Curves.easeInCubic,
                        child: Image.asset(
                          "assets/images/bird_image.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      // const Positioned(
                      //   top: 0,
                      //   right: 0,
                      //   child: ExplicitAnimationFavouriteIconButton(),
                      // ),
                      const SizedBox(
                        height: 100,
                      ),
                      PrimaryButtonInColumn(
                          onTapChangeDimension: () {
                            print("object");
                            setState(() {
                              isNewDimension = !isNewDimension;
                            });
                          },
                          onTapShowDescription: () {},
                          onTapChangeTheme: () {},
                          isShowDescription: isShowDescription)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PrimaryButtonInColumn extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapShowDescription;
  final Function onTapChangeTheme;
  final bool isShowDescription;
  const PrimaryButtonInColumn(
      {Key? key,
      required this.onTapChangeDimension,
      required this.onTapShowDescription,
      required this.onTapChangeTheme,
      required this.isShowDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
            label: "Change Dimension", onTap: () => onTapChangeDimension),
        PrimaryButton(
            label: (isShowDescription) ? "Hide Dimension" : "Show Description",
            onTap: () => onTapShowDescription),
        PrimaryButton(label: "Change Theme", onTap: () => onTapChangeTheme)
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const PrimaryButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(label));
  }
}
