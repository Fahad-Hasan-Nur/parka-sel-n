import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../service/auth_service.dart';

class AuthController extends GetxController {
  var login = true.obs;

  RxString phone = "".obs;
  RxString name = "".obs;
  RxString nid = "".obs;
  RxString sName = "".obs;
  RxString sAddress = "".obs;
  RxString sLoc = "".obs;
  RxString tradeLicenseNong = "".obs;
  RxString bName = "".obs;
  RxString bAccountNong = "".obs;
  RxString bAccountName = "".obs;
  RxString branchName = "".obs;
  RxString mfsNumner = "".obs;
  RxString mfsId = "".obs;
  RxBool isLoading = false.obs;
  var nidFrontImg = ''.obs;
  var nidBackImg = ''.obs;
  var tradeLicenseImg = ''.obs;

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }

  loginUser(String phone) async {
    final box = GetStorage();

    box.write('phone', phone);

    AuthService service = AuthService();
    //await service.getSData();
    await service.login(phone);
  }

  Future<bool> signUpUser() async {
    AuthService service = AuthService();
    return await service.signUpUser();
  }

  authenticate(String email, String otp) async {
    AuthService service = AuthService();
    await service.authenticate(email, otp);
  }
}
