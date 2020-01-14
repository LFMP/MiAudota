class Item {
  Item(
      {this.titulo,
      this.descricao,
      this.quantidade,
      this.qtdAtual,
      this.data,
      this.foto});

  Item.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descricao = json['descricao'];
    quantidade = json['quantidade'];
    data = json['data'];
    qtdAtual = json['qtdAtual'];
    foto = json['foto'];
  }
  String titulo;
  String descricao;
  String quantidade;
  DateTime data;
  String qtdAtual;
  String foto;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['titulo'] = this.titulo;
    dados['descricao'] = this.descricao;
    dados['quantidade'] = this.quantidade;
    dados['data'] = this.data;
    dados['qtdAtual'] = this.qtdAtual;
    dados['foto'] = this.foto;
    return dados;
  }
}
