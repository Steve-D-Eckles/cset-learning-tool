import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  String _short;
  String _full;

  String get short => _short;

  String get full => _full;

  var reference;

  Course.fromMap(Map<String, dynamic> map, {this.reference}) {
    _short = map["short"];
    _full = map["full"];
  }

  Course.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {
      'short': _short,
      'full': _full,
    };
  }
}