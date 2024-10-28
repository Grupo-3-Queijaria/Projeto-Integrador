class Tecnologia {
  int? id;
  String tipo;
  String racaBovina;
  int qtdLeite;
  DateTime data;
  String observacao;

  Tecnologia({
    this.id,
    required this.tipo,
    required this.racaBovina,
    required this.qtdLeite,
    required this.data,
    required this.observacao,
  });

  // Método para converter de JSON para objeto Tecnologia
  factory Tecnologia.fromJson(Map<String, dynamic> json) {
    return Tecnologia(
      id: json['id'],
      tipo: json['tipo'],
      racaBovina: json['raca_bovina'],
      qtdLeite: json['qtd_leite'],
      data: DateTime.parse(json['data']),
      observacao: json['observacao'],
    );
  }

  // Método para converter de objeto Tecnologia para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipo': tipo,
      'raca_bovina': racaBovina,
      'qtd_leite': qtdLeite,
      'data': data.toIso8601String(),
      'observacao': observacao,
    };
  }
}
