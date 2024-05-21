import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:okoa/theme/colors.dart';

class MapModeCard extends StatelessWidget {
  final String assetImage;
  final String title;
  final bool active;
  final VoidCallback onTap;

  const MapModeCard(
      {super.key,
      required this.assetImage,
      required this.title,
      this.active = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  card
            UnconstrainedBox(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color:
                        active ? accent : Theme.of(context).primaryColorLight,
                    shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    assetImage,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        active
                            ? Colors.black
                            : Theme.of(context).iconTheme.color!,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ),

            Text(title, style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      ),
    );
  }
}
