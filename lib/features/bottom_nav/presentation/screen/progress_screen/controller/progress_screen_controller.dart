import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../../../core/network/end_point/api_end_point.dart';
import '../../../../../../services/api_services/api_response_model.dart';
import '../../../../../../services/api_services/api_services.dart';
import '../../../../../../storage/storage_services.dart';
import '../data/note_model.dart';

class ProgressScreenController extends GetxController{
  RxList<FoodNote> notes = <FoodNote>[].obs;

  final TextEditingController addNoteTEController=TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }


  void addNoteLocal(String text) {
    if(text.trim().isEmpty) return;
    notes.add(FoodNote(id: 0, text: text.trim()));
    addNoteTEController.clear();
  }

  void removeNoteLocal(int index) {
    notes.removeAt(index);
  }

  void fetchNotes() async {
    try {
      ApiResponseModel response = await ApiService.get(
        ApiEndPoint.getNote,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}",
        },
      );

      List<FoodNote> fetchedNotes = [];

      if (response.data != null) {
        Map<String, dynamic> mapData;

        // যদি response.data already Map হয়
        if (response.data is Map) {
          mapData = response.data as Map<String, dynamic>;
        } else if (response.data is String) {
          mapData = jsonDecode(response.data) as Map<String, dynamic>;
        } else {
          mapData = {};
        }

        if (mapData.containsKey('data') &&
            mapData['data'].containsKey('observations')) {
          List observations = mapData['data']['observations'];
          fetchedNotes = observations
              .map((text) => FoodNote(id: 0, text: text.toString()))
              .toList();
        }
      }

      notes.assignAll(fetchedNotes);

    } catch (e) {
      print("Error fetching notes: $e");
    }
  }




  void sendNotesToServer() async {
    if (notes.isEmpty) return;

    List<String> observations = notes.map((note) => note.text).toList();

    try {
      ApiResponseModel response = await ApiService.post(
        ApiEndPoint.createNote, // তোমার সার্ভার এন্ডপয়েন্ট
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${LocalStorage.token}", // যদি auth লাগে
        },
        body: {
          "observations": observations,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Notes sent successfully: $observations");
        Get.back(); // Dialog বন্ধ করে
        Get.snackbar("Success", "Notes saved successfully!");
      } else {
        print("Failed to send notes. Status: ${response.statusCode}");
        Get.snackbar("Error", "Failed to save notes to server");
      }
    } catch (e) {
      print("Error sending notes: $e");
      Get.snackbar("Error", "Something went wrong while sending notes");
    }
  }





}
