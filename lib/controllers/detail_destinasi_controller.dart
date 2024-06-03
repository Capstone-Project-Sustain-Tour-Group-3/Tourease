import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailDestinasiController extends GetxController {
  var activeIndex = 0.obs;
  final CarouselController carouselController = CarouselController();

  final List<String> imageUrls = [
    'https://s3-alpha-sig.figma.com/img/3724/79e5/aee15fbeffd46f06ee3d5bf9a480f91a?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q4BfYqs50CK~8UuwRpPd5IdbSe27gEe4QUjIzyWL2Z-FebNx1PsHWGm5aHn5f7iZ0fx0fiOeE19cJ8RKBxxSz-iPFI8I9x7NxDhg-A-5ToZ1XL3Ukaol~d8yuTjmbuNKQp2UrcUYvxblDn6f-ghvmkb7VoedlGmeW3OpcnhjNhcBNJsz562axQyxAcx5OcGVGxS6pYO3OEhiXeQx-Q0350S2wsCZyxVQiIEUKVXaFBflZ31BitWmumbxbxBDs80IFdHK5FCCtDhM6VkdcnnUqjJYHbwa20SrUWDt-cfxs4fXhvZ8IDn3YZwoh0CLadonLEFAuif-cL8V9A2387WIrw__',
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200',
  ];
}