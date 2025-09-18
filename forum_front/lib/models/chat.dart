class Chat {
  String? answer;

  Chat({
    required this.answer,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      answer: json["answer"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {"answer": answer};
  }
}
