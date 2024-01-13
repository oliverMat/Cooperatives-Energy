import 'dart:convert';

List<Offer> parseOffers(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
}

class Offer {
  final String nome;
  final String valorMinimoMensal;
  final String ValorMaximoMensal;
  final String desconto;

  const Offer({
    required this.nome,
    required this.valorMinimoMensal,
    required this.ValorMaximoMensal,
    required this.desconto,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      nome: json['nome'] as String,
      valorMinimoMensal: json['valorMinimoMensal'] as String,
      ValorMaximoMensal: json['ValorMaximoMensal'] as String,
      desconto: json['desconto'] as String,
    );
  }
}
