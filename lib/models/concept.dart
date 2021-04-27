import 'package:cloud_firestore/cloud_firestore.dart';

class Concept {
  String _title;
  String _body;

  String get title => _title;

  String get body => _body;

  var reference;

  Concept.fromMap(Map<String, dynamic> map, {this.reference}) {
    _title = map["title"];
    _body = map["body"];
  }

  Concept.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {
      'title': _title,
      'body': _body,
    };
  }
}