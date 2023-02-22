class Pessoa {
  final String nome;
  final String cpf;
  final String sexo;
  final String nascimento;
  final int peso;
  final int altura;
  final String telefone;
  final String observacao;
  final String email;
  final String funcao;
  final double salario;
  final String turno;
  final int tipocadastro;

  Pessoa(
      this.nome,
      this.cpf,
      this.sexo,
      this.nascimento,
      this.peso,
      this.altura,
      this.telefone,
      this.observacao,
      this.email,
      this.funcao,
      this.salario,
      this.turno,
      this.tipocadastro);

  @override
  String toString() {
    // TODO: implement toString
    return 'Pessoa{$nome, $cpf, $sexo, $nascimento, $peso, $altura, $telefone, $observacao, $email, $funcao, $salario, $turno, $tipocadastro}';
  }

  Pessoa.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        cpf = json['cpf'],
        sexo = json['sexo'],
        nascimento = json['nascimento'],
        peso = json['peso'],
        altura = json['altura'],
        telefone = json['telefone'],
        observacao = json['observacao'],
        email = json['email'],
        funcao = json['funcao'],
        salario = json['salario'],
        turno = json['turno'],
        tipocadastro = json['tipocadastro'];

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "cpf": cpf,
        "sexo": sexo,
        "nascimento": nascimento,
        "peso": peso,
        "altura": altura,
        "telefone": telefone,
        "observacao": observacao,
        "email": email,
        "funcao": funcao,
        "salario": salario,
        "turno": turno,
        "tipocadastro": tipocadastro
      };
}
