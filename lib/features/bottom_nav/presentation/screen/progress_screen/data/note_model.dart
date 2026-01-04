class FoodNote {
  int id;
  String text;

  FoodNote({required this.id, required this.text});

  factory FoodNote.fromJson(Map<String, dynamic> json) {
    return FoodNote(id: json['id'], text: json['text']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'text': text};
}
