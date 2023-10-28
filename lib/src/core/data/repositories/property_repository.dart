import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/property.dart';

class PropertyRepository {
  final CollectionReference propertiesCollection = FirebaseFirestore.instance
      .collection('properties');

  Future<List<Property>> getProperties() async {
    try {
      QuerySnapshot querySnapshot = await propertiesCollection.get();
      List<Property> properties = querySnapshot.docs.map((doc) {
        return Property.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return properties;
    } catch (e) {
      print("Error getting properties: $e");
      return [];
    }
  }

  Future<void> postProperty(Property property) async {

  }
}
