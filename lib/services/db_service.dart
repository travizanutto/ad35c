import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  static final DataBaseService _instance = DataBaseService();
  final FirebaseFirestore _fbInstance = FirebaseFirestore.instance;
  
  static get() => _instance._fbInstance;
}
