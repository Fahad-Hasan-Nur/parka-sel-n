import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var isSignedUp = false.obs;

  //final addPageController = PageController(viewportFraction: 0.9);
  //final currentAddPageNotifier = ValueNotifier<int>(0);

  final count = 0.obs;
  @override
  onInit() async {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
