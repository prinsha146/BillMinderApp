class Bill {
  String name;
  double amount;
  String frequency;
  String startDate;
  String? endDate;
  String notifyAt;
  String? note;

  Bill({
    required this.name,
    required this.amount,
    required this.frequency,
    required this.startDate,
    this.endDate,
    required this.notifyAt,
    this.note,
  });
}