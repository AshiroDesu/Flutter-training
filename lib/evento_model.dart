import 'dart:convert';

class Evento {
  String id;
  String name;
  int amount;

  Evento({
    required this.id,
    required this.name,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
    };
  }

  factory Evento.fromMap(Map<String, dynamic> map) {
    return Evento(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Evento.fromJson(String source) => Evento.fromMap(json.decode(source));

  @override
  String toString() => 'Evento(id: $id, name: $name, amount: $amount)';
}
