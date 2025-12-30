import 'package:get/get.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';

class TermsAndServiceController extends GetxController {
  var termsAndServices = '';
  var isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getTermsAndService();
  }

  Future<void> getTermsAndService() async {
    try {
      isLoading = true;
      update();

      final response = await ApiService.get(
        ApiEndPoint.termsAndServiceEndPo,
        headers: {"Accept": "application/json"},
      );

      print("Response Status: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        final decoded = response.data;

        if (decoded["data"] != null && decoded["data"] is Map) {
          String htmlContent = decoded["data"]["content"] ?? "";
          String plainText = htmlContent.replaceAll(RegExp(r"<[^>]*>"), "");
          termsAndServices = plainText;
        } else {
          termsAndServices = "No terms and services available";
        }
      } else {
        termsAndServices = "No terms and services available";
      }
    } catch (e) {
      termsAndServices = "Error loading terms and services";
      print("Error: ${e.toString()}");
    } finally {
      isLoading = false;
      update();
    }
  }
}