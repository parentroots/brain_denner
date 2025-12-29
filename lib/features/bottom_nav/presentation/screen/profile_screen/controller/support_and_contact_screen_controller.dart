import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';

class SupportAndContactScreenController extends GetxController {

  // ================= Controllers =================
  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController issuesTEController = TextEditingController();

  // ================= State =================
  bool isLoading = false;
  String supportResponseMessage = "";

  // ================= POST API =================
  Future<void> postSupportContact() async {
    try {
      if (titleTEController.text.trim().isEmpty ||
          issuesTEController.text.trim().isEmpty) {
        Get.snackbar("Error", "Title & message required");
        return;
      }

      isLoading = true;
      update();

      print("=== Sending Support Request ===");
      print("Title: ${titleTEController.text}");
      print("Message: ${issuesTEController.text}");
      print("Token: ${LocalStorage.token}");

      final response = await ApiService.post(
        ApiEndPoint.supportCreate,
        body: {
          "title": titleTEController.text.trim(),
          "message": issuesTEController.text.trim(),
        },

      );

      print("=== API Response ===");
      print("Status Code: ${response.statusCode}");
      print("Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {

          Get.snackbar(
            "Success",
            response.data["message"] ?? "Support created successfully",
            snackPosition: SnackPosition.BOTTOM,
          );

          titleTEController.clear();
          issuesTEController.clear();

      } else {
        Get.snackbar(
          "Failed",
          "Status Code: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
      print("Error: $e");
    } finally {
      isLoading = false;
      update();
    }
  }


  @override
  void onClose() {
    titleTEController.dispose();
    issuesTEController.dispose();
    super.onClose();
  }
}
