import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz {
  String _question;
  String _ans;
  // ignore: non_constant_identifier_names
  String _res_a;
  // ignore: non_constant_identifier_names
  String _res_b;
  // ignore: non_constant_identifier_names
  String _res_c;
  // ignore: non_constant_identifier_names
  String _res_d;

  String get question => _question;
  String get ans => _ans;
  // ignore: non_constant_identifier_names
  String get res_a => _res_a;
  // ignore: non_constant_identifier_names
  String get res_b => _res_b;
  // ignore: non_constant_identifier_names
  String get res_c => _res_c;
  // ignore: non_constant_identifier_names
  String get res_d => _res_d;

  var reference;

  Quiz.fromMap(Map<String, dynamic> map, {this.reference}) {
    _question = map["question"];
    _ans = map["ans"];
    _res_a = map["res_a"];
    _res_b = map["res_b"];
    _res_c = map["res_c"];
    _res_d = map["res_d"];

  }

 Quiz.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {
      'question': _question,
      'ans': _ans,
      'res_a':_res_a,
      'res_b':_res_b,
      'res_c':_res_c,
      'res_d':_res_d
    };
  }
}