import 'package:brain_denner/storage/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brain_denner/services/api_services/api_services.dart';
import 'package:brain_denner/core/network/end_point/api_end_point.dart';

class RateAppController extends GetxController {
  var rating = 0.0;
  var isLoading = false;

  void updateRating(double newRating) {
    rating = newRating;
    update();
  }

  Future<void> submitRating() async {
    if (rating == 0) {
      Get.snackbar(
        'Error',
        'Please select a rating',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading = true;
      update();



      final response = await ApiService.post(
        ApiEndPoint.rateAppEndPo,
        body: {
          "stars": rating,
        },
      );


      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        print("Status Code ${response.statusCode}");
        print("rating Code ${rating}");

        // Get.snackbar(
        //   'Success',
        //   response.data?['message'] ?? 'Thank you for rating our app!',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        //   duration: Duration(seconds: 2),
        // );
        Get.back();
        update();


      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Session Expired',
          'Please login again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      } else if (response.statusCode == 500) {
        Get.snackbar(
          'Server Error',
          'Server is having issues. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          response.data?['message'] ?? 'Failed to submit rating. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading = false;
      update();
    }
  }
}