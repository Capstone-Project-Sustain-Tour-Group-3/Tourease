import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/cached_network_image_widget.dart';

class HomeCardDestinasi extends StatelessWidget {
  const HomeCardDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          color: ColorNeutral.neutral50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: ColorNeutral.neutral200,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: CachedNetworkImageWidget(
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/3724/79e5/aee15fbeffd46f06ee3d5bf9a480f91a?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q4BfYqs50CK~8UuwRpPd5IdbSe27gEe4QUjIzyWL2Z-FebNx1PsHWGm5aHn5f7iZ0fx0fiOeE19cJ8RKBxxSz-iPFI8I9x7NxDhg-A-5ToZ1XL3Ukaol~d8yuTjmbuNKQp2UrcUYvxblDn6f-ghvmkb7VoedlGmeW3OpcnhjNhcBNJsz562axQyxAcx5OcGVGxS6pYO3OEhiXeQx-Q0350S2wsCZyxVQiIEUKVXaFBflZ31BitWmumbxbxBDs80IFdHK5FCCtDhM6VkdcnnUqjJYHbwa20SrUWDt-cfxs4fXhvZ8IDn3YZwoh0CLadonLEFAuif-cL8V9A2387WIrw__',
                    height: 160,
                    width: 220,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Gua Jomblang',
                      style: TextStyleCollection.bodyBold.copyWith(
                        color: ColorPrimary.primary500,
                      ),
                      minFontSize: 16,
                      maxFontSize: 18,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      'Gunung Kidul, Yogyakarta',
                      style: TextStyleCollection.captionMedium.copyWith(
                        color: ColorNeutral.neutral800,
                      ),
                      minFontSize: 14,
                      maxFontSize: 16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
