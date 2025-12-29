import 'package:get/get.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';
class PrivacyPolicyController extends GetxController {
  var privacyPolicy = '';
  var isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicy();
  }

  Future<void> getPrivacyPolicy() async {
    try {
      isLoading = true;
      update();

      final response = await ApiService.get(
        ApiEndPoint.privacyPolicyEndPo,
        headers: {"Accept": "application/json"},
      );

      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        final decoded = response.data;

        if (decoded["data"] != null && decoded["data"] is Map) {
          String htmlContent = decoded["data"]["content"] ?? "";

          String plainText = htmlContent.replaceAll(RegExp(r"<[^>]*>"), "");

          privacyPolicy = plainText;
        } else {
          privacyPolicy = "No privacy policy available";
        }
      } else {
        privacyPolicy = "No privacy policy available";
      }
    } catch (e) {
      privacyPolicy = "Error loading privacy policy";
      print("Error: ${e.toString()}");
    } finally {
      isLoading = false;
      update();
    }
  }

}