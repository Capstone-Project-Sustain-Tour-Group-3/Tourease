import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class HomeContainerDestinasiPopuler extends StatelessWidget {
  const HomeContainerDestinasiPopuler({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageWidget(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/2a59/8f2e/fceeb174fda1c67dc27fe0de0bd70f7b?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSHJazXUCN3hjsZh2CJ0exfWcQCaCEPbT5loOSr1g3oOWfClJj0tsUbULqr5Z0NyZ70rdsG3ihEC6jTleEZJjfpqrg~vwla-Y0CtqXOK8IPbkegcSJz1FRseEh7Nzc7ICJxlQvLY927svbyxiNyeiMl3IZq8uXnZ0AS4U3fNaRoEHprOx4kTJHRbPm8QX~FCRYAGY2aFnjITOpu~~uHgaOxKCW7PxmH3jZMuhF729w07hIpOv1-YqKwmEF3hOjM8sTqEJsH4nVqO8bFKdzmKnU8HrHnlQ8ms7F99drkSAPeg2eTcfbGktG8g4yziQYDJGhBEAMljKSBHokkxjrIMcw__',
      imageBuilder: (context, imageProvider) => Container(
        width: 142,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              ColorCollection.black.withOpacity(0.3),
              BlendMode.colorBurn,
            ),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  color: ColorNeutral.neutral50,
                  size: 50,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  'Membatik dan belajar sejarah keraton di museum Ullen Sentalu',
                  style: TextStyleCollection.captionBold.copyWith(
                    color: ColorCollection.lightGray,
                  ),
                  minFontSize: 11,
                  maxFontSize: 12,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
