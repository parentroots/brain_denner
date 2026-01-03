import 'dart:convert';

import 'package:brain_denner/features/bottom_nav/presentation/screen/profile_screen/data/contact_model.dart';
import 'package:brain_denner/services/api_services/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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

  ContactModel? contactInfo;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getContactInfo();
  }




  // ==========================POST API =====================

  Future<void> postSupportContact() async {
    try {

      isLoading = true;
      update();

      print("=== Sending Support Request ===");
      print("Title: ${titleTEController.text}");
      print("Message: ${issuesTEController.text}");
      print("Token: ${LocalStorage.token}");

      final response = await ApiService.post(
        ApiEndPoint.supportCreate,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}",
        },
        body: {
          "title": titleTEController.text,
          "message": issuesTEController.text,
        },
      );



      print("=== API RESPONSE RECEIVED ===");
      print("Status Code: ${response.statusCode}");
      print("Message: ${response.message}");
      print("Data: ${response.data}");




      if (response.statusCode == 200 || response.statusCode == 201) {

        debugPrint("Support Message Successful${response.data}");

          Get.snackbar(
            "Success",
            response.data["message"] ?? "Support created successfully",

          );

     clearTextField();

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



  Future<void> getContactInfo() async {
    try {
      isLoading = true;
      update(); // UI refresh

      final response = await ApiService.get(
        ApiEndPoint.contactInfo,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> jsonResponse =
        response.data is String ? jsonDecode(response.data) : response.data;

        contactInfo = ContactModel.fromJson(jsonResponse['data']);
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
      debugPrint("Error in getContactInfo: $e");
    } finally {
      isLoading = false;
      update(); // UI refresh
    }
  }


  ///=========================================go to support and contact===================
// Call phone
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

// Send WhatsApp message
  Future<void> sendWhatsAppMessage(String number, String message) async {
    final Uri whatsappUrl = Uri.parse(
        "https://wa.me/${number.replaceAll('+', '')}?text=${Uri.encodeComponent(message)}");
    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $whatsappUrl';
    }
  }

// Send email
  Future<void> sendEmail(String email, {String subject = '', String body = ''}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch $emailUri';
    }
  }

  ///=====================================================================================

  
  
  

  void clearTextField(){

    titleTEController.clear();
    issuesTEController.clear();
  }

  @override
  void onClose() {
    titleTEController.dispose();
    issuesTEController.dispose();
    super.onClose();
  }
}
