class TransactionModel {
  String name;
  String description;
  double price;
  String date;
  String cardAlias;

  TransactionModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.date,
      required this.cardAlias});

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "description": this.description,
      "price": this.price,
      "date": this.date,
    };
  }
}
