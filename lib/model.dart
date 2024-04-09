import 'dart:convert';

// Predict userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class Predict {
  double preg;
  double plas;
  double pres;
  double skin;
  double insu;
  double mass;
  double pedi;
  double age;
  Predict({
    required this.preg,
    required this.plas,
    required this.pres,
    required this.skin,
    required this.insu,
    required this.mass,
    required this.pedi,
    required this.age,
  });

  Predict copyWith({
    double? preg,
    double? plas,
    double? pres,
    double? skin,
    double? insu,
    double? mass,
    double? pedi,
    double? age,
  }) {
    return Predict(
      preg: preg ?? this.preg,
      plas: plas ?? this.plas,
      pres: pres ?? this.pres,
      skin: skin ?? this.skin,
      insu: insu ?? this.insu,
      mass: mass ?? this.mass,
      pedi: pedi ?? this.pedi,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'preg': preg,
      'plas': plas,
      'pres': pres,
      'skin': skin,
      'insu': insu,
      'mass': mass,
      'pedi': pedi,
      'age': age,
    };
  }

  factory Predict.fromMap(Map<String, dynamic> map) {
    return Predict(
      preg: map['preg']?.toDouble() ?? 0.0,
      plas: map['plas']?.toDouble() ?? 0.0,
      pres: map['pres']?.toDouble() ?? 0.0,
      skin: map['skin']?.toDouble() ?? 0.0,
      insu: map['insu']?.toDouble() ?? 0.0,
      mass: map['mass']?.toDouble() ?? 0.0,
      pedi: map['pedi']?.toDouble() ?? 0.0,
      age: map['age']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Predict.fromJson(String source) =>
      Predict.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Predict(preg: $preg, plas: $plas, pres: $pres, skin: $skin, insu: $insu, mass: $mass, pedi: $pedi, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Predict &&
        other.preg == preg &&
        other.plas == plas &&
        other.pres == pres &&
        other.skin == skin &&
        other.insu == insu &&
        other.mass == mass &&
        other.pedi == pedi &&
        other.age == age;
  }

  @override
  int get hashCode {
    return preg.hashCode ^
        plas.hashCode ^
        pres.hashCode ^
        skin.hashCode ^
        insu.hashCode ^
        mass.hashCode ^
        pedi.hashCode ^
        age.hashCode;
  }
}

//   factory Predict.fromJson(Map<String, dynamic> json) => Predict(
//         MDVPFo: json["MDVPFo"],
//         MDVPFhi: json["MDVPFhi"],
//         MDVPFlo: json["MDVPFlo"],
//         MDVPJitter: json["MDVPJitter"],
//         MDVPJitterAbs: json["MDVPJitterAbs"],
//         MDVPRAP: json["MDVPRAP"],
//         MDVPPPQ: json["MDVPPPQ"],
//         JitterDDP: json["JitterDDP"],
//         MDVPShimmer: json["MDVPShimmer"],
//         MDVPShimmerdB: json["MDVPShimmerdB"],
//         ShimmerAPQ3: json["ShimmerAPQ3"],
//         ShimmerAPQ5: json["ShimmerAPQ5"],
//         MDVPAPQ: json["MDVPAPQ"],
//         ShimmerDDA: json["ShimmerDDA"],
//         NHR: json["NHR"],
//         HNR: json["HNR"],
//         RPDE: json["RPDE"],
//         DFA: json["DFA"],
//         spread1: json["spread1"],
//         spread2: json["spread2"],
//         D2: json["D2"],
//         PPE: json["PPE"],
//       );

//   Map<String, dynamic> toJson() => {
//         "MDVPFo": MDVPFo,
//         "MDVPFhi": MDVPFhi,
//         "MDVPFlo": MDVPFlo,
//         "MDVPJitter": MDVPJitter,
//         "MDVPJitterAbs": MDVPJitterAbs,
//         "MDVPRAP": MDVPRAP,
//         "MDVPPPQ": MDVPPPQ,
//         "JitterDDP": JitterDDP,
//         "MDVPShimmer": MDVPShimmer,
//         "MDVPShimmerdB": MDVPShimmerdB,
//         "ShimmerAPQ3": ShimmerAPQ3,
//         "ShimmerAPQ5": ShimmerAPQ5,
//         "MDVPAPQ": MDVPAPQ,
//         "ShimmerDDA": ShimmerDDA,
//         "NHR": NHR,
//         "HNR": HNR,
//         "RPDE": RPDE,
//         "DFA": DFA,
//         "spread1": spread1,
//         "spread2": spread2,
//         "D2": D2,
//         "PPE": PPE,
//       };
// }

ResultModel resultModelString(String str) =>
    ResultModel.fromJson(json.decode(str));

class ResultModel {
  String prediction;

  ResultModel({required this.prediction});

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      ResultModel(prediction: json["prediction"]);

  set result(String value) {}

  String get result {
    String? pal;
    if (prediction == "[1]") {
      pal = "Tested Positive";
    } else {
      pal = "Tested Negative";
    }
    return pal;
  }
}
