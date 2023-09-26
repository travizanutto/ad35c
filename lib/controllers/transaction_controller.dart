import 'package:get/get.dart';
import 'package:vwalltet/controllers/card_controller.dart';
import 'package:vwalltet/models/transaction_model.dart';
import 'package:vwalltet/repositories/card_repository.dart';

class TransactionController extends GetxController {
  final cardController = Get.find<CardController>();
}
