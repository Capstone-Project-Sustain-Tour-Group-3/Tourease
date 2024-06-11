import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/profil/profil_tentang_kami_text_widget.dart';

class ProfilTentangKami extends StatelessWidget {
  const ProfilTentangKami({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
        appBar: AppBar(
          toolbarHeight: 56,
          backgroundColor: ColorNeutral.neutral50,
          surfaceTintColor: ColorNeutral.neutral50,
          centerTitle: true,
          title: AutoSizeText(
            'Tentang Kami',
            style: TextStyleCollection.subtitleBold
                .copyWith(color: ColorNeutral.neutral900),
            minFontSize: 18,
            maxFontSize: 20,
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 24),
                child: ProfilTentangKamiTextWidget(
                    title: 'Mengapa Tourease?',
                    description:
                        'TourEase adalah platform wisata yang dirancang untuk memudahkan Anda menemukan destinasi impian dengan mudah dan cepat. Temukan ribuan tempat wisata yang indah dan menarik di indonesia, sesuai dengan preferensi Anda, mulai dari pantai berpasir putih, gunung yang menjulang tinggi, hingga kota-kota bersejarah.'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 24),
                child: ProfilTentangKamiTextWidget(
                    title: 'Misi kami',
                    description:
                        'Di TourEase, kami memiliki misi untuk memudahkan setiap individu menjelajahi dunia. Kami berkomitmen menyediakan informasi lengkap tentang berbagai destinasi wisata, akses rute perjalanan terbaik, dan bantuan dari asisten AI cerdas yang memberikan rekomendasi personal sesuai preferensimu. Kami ingin setiap perjalanan menjadi pengalaman menyenangkan dan efisien, membantu Anda menikmati keindahan dunia dengan cara yang paling nyaman.'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                child: ProfilTentangKamiTextWidget(
                    title: 'Layanan Kami',
                    description:
                        'TourEase menawarkan berbagai layanan untuk memaksimalkan pengalaman wisatamu. Dapatkan rekomendasi tempat wisata yang dipersonalisasi, temukan rute perjalanan terbaik, simpan rute favoritmu untuk akses mudah di masa mendatang, dan manfaatkan AI Assistant kami untuk saran terkini tentang destinasi dan aktivitas. Jelajahi berbagai destinasi menarik dan nikmati konten video inspiratif yang menampilkan keindahan tempat-tempat di seluruh dunia. Nikmati dunia dengan mudah dan menyenangkan bersama TourEase!'),
              ),
            ],
          ),
        ));
  }
}
