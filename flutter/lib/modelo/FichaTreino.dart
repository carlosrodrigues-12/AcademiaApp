class FichaTreino {
  final int pessoa;
  final int exercicio;

  FichaTreino(
      this.pessoa,
      this.exercicio,
      );

  @override
  String toString() {
    // TODO: implement toString
    return 'Pessoa{$pessoa, $exercicio}';
  }

  FichaTreino.fromJson(Map<String, dynamic> json)
      : pessoa = json['pessoa'],
        exercicio = json['exercicio'];

  Map<String, dynamic> toJson() => {
    "pessoa": pessoa,
    "exercicio": exercicio,
  };
}
