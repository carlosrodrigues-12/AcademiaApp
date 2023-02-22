class Exercicio {
  final String nome;
  final String descricao;
  final int series;
  final int repeticoes;
  final String equipamento;

  Exercicio(
      this.nome,
      this.descricao,
      this.series,
      this.repeticoes,
      this.equipamento,
      );

  @override
  String toString() {
    // TODO: implement toString
    return 'Pessoa{$nome, $descricao, $series, $repeticoes, $equipamento}';
  }

  Exercicio.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        descricao = json['descricao'],
        series = json['series'],
        repeticoes = json['repeticoes'],
        equipamento = json['equipamento'];

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "descricao": descricao,
    "series": series,
    "repeticoes": repeticoes,
    "equipamento": equipamento
  };
}
