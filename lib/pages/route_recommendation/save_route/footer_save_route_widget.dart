import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

class FooterSaveRouteWidget extends StatelessWidget {
  const FooterSaveRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: ColorNeutral.neutral50,
          boxShadow: [
            BoxShadow(
              color: ColorCollection.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        height: 96,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 16, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimasi Biaya',
                    style: TextStyleCollection.caption
                        .copyWith(color: ColorNeutral.neutral900, fontSize: 14),
                  ),
                  Text(
                    'Rp 200.000',
                    style: TextStyleCollection.bodyBold
                        .copyWith(color: ColorPrimary.primary900, fontSize: 16),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    content: Container(
                      color: ColorNeutral.neutral50,
                      height: 180,
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            textAlign: TextAlign.center,
                            "Simpan Rute Perjalanan",
                            style: TextStyleCollection.bodyBold.copyWith(
                              fontSize: 16,
                              color: ColorNeutral.neutral900,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            height: 48,
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                                left: 16, bottom: 12, top: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorNeutral.neutral200,
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.highlight_remove,
                                  color: ColorNeutral.neutral500,
                                ),
                                hintText: 'Masukkan nama rute ...',
                                hintStyle: TextStyleCollection.caption.copyWith(
                                  color: ColorNeutral.neutral700,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ButtonWidget(
                              onPressed: () {},
                              text: 'Simpan',
                              textColor: ColorNeutral.neutral100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: ColorNeutral.neutral50,
                      ),
                    ),
                    backgroundColor: ColorNeutral.neutral50,
                    elevation: 16,
                    shadowColor: const Color(0xFF000000).withOpacity(0.1),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 14, right: 14, bottom: 24),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorPrimary.primary700,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 48,
                  width: 157,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Icon(
                          Icons.bookmark,
                          color: ColorPrimary.primary500,
                        ),
                      ),
                      Text(
                        'Simpan Rute',
                        style: TextStyleCollection.captionMedium.copyWith(
                            color: ColorPrimary.primary500, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
