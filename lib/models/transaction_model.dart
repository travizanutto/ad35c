class TransactionModel {
  String name;
  String description;
  double price;
  DateTime date;

  TransactionModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.date});
}
