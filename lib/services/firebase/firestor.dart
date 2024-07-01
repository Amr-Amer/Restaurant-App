import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  //todo:  get collection of orders

  final CollectionReference orders =
      FirebaseFirestore.instance.collection("orders");

  // todo: save orders to firebase
  Future<void> saveOrdersToFireStore(String receipt) async {
    await orders.add({'data': DateTime.now(), 'order': receipt});
  }
}
