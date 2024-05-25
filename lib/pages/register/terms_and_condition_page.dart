import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/register/terms_and_condition_widgets.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlay style to ensure consistent status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // Status bar icon color
          statusBarBrightness: Brightness.dark),
    );

    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      appBar: AppBar(
        backgroundColor: ColorNeutral.neutral50,
        surfaceTintColor: ColorNeutral.neutral50,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorPrimary.primary500,
          ),
        ),
        title: AutoSizeText(
          'Syarat dan Ketentuan',
          style: TextStyleCollection.bodyBold.copyWith(
            color: ColorNeutral.neutral900,
          ),
          minFontSize: 18,
          maxFontSize: 20,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Selamat datang di Tourease!',
                        style: TextStyleCollection.bodyBold.copyWith(
                          fontSize: 20,
                          color: ColorPrimary.primary500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tourease adalah aplikasi yang membantu Anda merencanakan dan menikmati perjalanan Anda. Dengan fitur-fitur seperti rekomendasi personal,'
                      ' rekomendasi rute, profil, home, rute tersimpan, asisten AI, destinasi, dan konten video, Tourease bertujuan untuk menjadi teman perjalanan Anda yang ideal.'
                      '\n\nSebelum Anda mulai menggunakan Tourease, mohon luangkan waktu untuk membaca Syarat dan Ketentuan ini dengan seksama. Dengan menggunakan Tourease, Anda dianggap telah menyetujui dan terikat oleh Syarat dan Ketentuan ini.',
                      style: TextStyleCollection.caption.copyWith(
                        fontSize: 14,
                        color: ColorNeutral.neutral700,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    const SectionTitle(title: '1. Akun Pengguna'),
                    const BulletPoint(
                        text:
                            'Untuk menggunakan Tourease, Anda harus membuat akun pengguna.'),
                    const BulletPoint(
                        text:
                            'Anda harus memberikan informasi yang benar dan akurat saat membuat akun.'),
                    const BulletPoint(
                        text:
                            'Anda bertanggung jawab untuk menjaga keamanan akun Anda dan semua aktivitas yang terjadi di bawah akun Anda.'),
                    const SizedBox(height: 16),
                    const SectionTitle(title: '2. Penggunaan Tourease'),
                    const BulletPoint(
                        text:
                            'Anda hanya boleh menggunakan Tourease untuk tujuan yang sah dan sesuai dengan hukum.'),
                    const BulletPoint(
                        text:
                            'Anda tidak boleh menggunakan Tourease untuk tujuan yang dapat merugikan atau mengganggu orang lain.'),
                    const BulletPoint(
                        text:
                            'Anda tidak boleh menggunakan Tourease untuk menyebarkan spam atau konten yang tidak diinginkan lainnya.'),
                    const BulletPoint(
                        text:
                            'Anda tidak boleh menggunakan Tourease untuk tujuan komersial tanpa persetujuan tertulis dari Tourease.'),
                    const SizedBox(height: 16),
                    const SectionTitle(title: '3. Hak Kekayaan Intelektual'),
                    const BulletPoint(
                        text:
                            'Semua hak cipta, merek dagang, dan hak kekayaan intelektual lainnya dalam Tourease adalah milik Tourease atau pemberi lisensinya.'),
                    const BulletPoint(
                        text:
                            'Anda tidak boleh menggunakan materi apa pun dari Tourease tanpa persetujuan tertulis dari Tourease.'),
                    const SizedBox(height: 16),
                    const SectionTitle(title: '4. Batasan Tanggung Jawab'),
                    const BulletPoint(
                        text:
                            'Tourease tidak bertanggung jawab atas kerusakan apa pun yang mungkin timbul dari penggunaan Tourease.'),
                    const BulletPoint(
                        text:
                            'Tourease tidak bertanggung jawab atas konten apa pun yang diunggah ke Tourease oleh pengguna.'),
                    const BulletPoint(
                        text:
                            'Tourease tidak bertanggung jawab atas tautan apa pun ke situs web lain yang terdapat di Tourease.'),
                    const SizedBox(height: 16),
                    const SectionTitle(
                        title: '5. Perubahan Syarat dan Ketentuan'),
                    const BulletPoint(
                        text:
                            'Tourease berhak untuk mengubah Syarat dan Ketentuan ini kapan saja.'),
                    const BulletPoint(
                        text:
                            'Jika Tourease mengubah Syarat dan Ketentuan ini, Tourease akan menginformasikan pemberitahuan di aplikasi dan/atau situs web Tourease.'),
                    const BulletPoint(
                        text:
                            'Dengan terus menggunakan Tourease setelah perubahan Syarat dan Ketentuan ini, Anda dianggap telah menyetujui perubahan tersebut.'),
                    const SizedBox(height: 16),
                    const SectionTitle(title: '6. Penghentian'),
                    const BulletPoint(
                        text:
                            'Tourease berhak untuk menghentikan akun Anda kapan saja, dengan atau tanpa alasan.'),
                    const BulletPoint(
                        text:
                            'Jika akun Anda dihentikan, Anda tidak akan lagi dapat mengakses Tourease.'),
                    const SizedBox(height: 16),
                    const SectionTitle(title: '7. Hukum yang Berlaku'),
                    const BulletPoint(
                        text:
                            'Syarat dan Ketentuan ini diatur oleh dan ditafsirkan sesuai dengan hukum Indonesia.'),
                    const BulletPoint(
                        text:
                            'Setiap perselisihan yang timbul dari atau terkait dengan Syarat dan Ketentuan ini akan diselesaikan oleh pengadilan yang kompeten di Indonesia.'),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Terima kasih telah menggunakan Tourease!',
                        style: TextStyleCollection.bodyBold.copyWith(
                          fontSize: 14,
                          color: ColorNeutral.neutral900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
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
