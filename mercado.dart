import 'dart:io';
class Produto {
  String? nome;
  double? valor;
  DateTime? validade;

  Produto(this.nome, this.valor, this.validade);
}
//listando os produtoso com (Nome, preço, Data de Validade)
//A data de validade deverá ser por formato ISO (yyyy/mm/dd)
void main() {
  List<Produto> listaDeProdutos = [
    Produto('Arroz', 20.0, DateTime(2024, 10, 1)),
    Produto('Feijão', 7.5, DateTime(2024, 9, 15)),
    Produto('Macarrão', 5.0, DateTime(2024, 11, 10)),
    Produto('Leite', 4.5, DateTime(2024, 9, 25)),
    Produto('Pão', 3.0, DateTime(2024, 9, 20)),
    Produto('Azeite', 6.0, DateTime(2024, 10, 5)),
    Produto('Queijo', 15.0, DateTime(2024, 10, 15)),
    Produto('Mortadela', 12.0, DateTime(2024, 9, 30)),
    Produto('Café', 8.0, DateTime(2024, 12, 1)),
    Produto('Sal', 4.0, DateTime(2025, 1, 1)),
  ];

  print('Digite a data de hoje (yyyy-mm-dd):');
  String? dataHojeStr = stdin.readLineSync();
  DateTime dataHoje = DateTime.parse(dataHojeStr!);

  print('Digite seu saldo:');
  double saldo = double.parse(stdin.readLineSync()!);
//Quantidade de produtos a ser realizado o pedido
//Necessário que seja um valor númerico decimal
  print('Quantos itens você quer comprar ?');

  int quantidadeItens = int.parse(stdin.readLineSync()!);

  double totalCompra = 0.0;
  List<Produto> itensComprados = [];
// Lista com o nome dos produtos disponiveis
print('Nós Temos:\nArroz \nFeijão \nMacarrão \nLeite \nPão \nAzeite \nQueijo \nMortadela \nCafé \nSal');
  for (int i = 0; i < quantidadeItens; i++) {
    print('Digite o nome do produto:');
    String? nomeProduto = stdin.readLineSync();
    Produto? produto = listaDeProdutos.firstWhere(
        (p) => p.nome!.toLowerCase() == nomeProduto!.toLowerCase(),
        orElse: () => Produto('', 0.0, DateTime.now()));

    if (produto.nome!.isEmpty) {
      print('Produto não encontrado.');
      i--;
      continue;
    }

    if (produto.validade!.isBefore(dataHoje)) {
      Duration diferenca = dataHoje!.difference(produto.validade!);
      print(
          'O produto ${produto.nome} está vencido há ${diferenca.inDays} dias.');
      i--;
      continue;
    }

    totalCompra += produto.valor!;
    itensComprados.add(produto);
  }
  if (totalCompra > saldo) {
    print('Saldo insuficiente. Faltam R\$${(totalCompra - saldo).toStringAsFixed(2)}.');
  } else {
    double troco = saldo - totalCompra;
    print('Compra realizada com sucesso!');
    print('Itens comprados:');
    for (var item in itensComprados) {
      print('${item.nome} - R\$${item.valor!.toStringAsFixed(2)}');
    }
    print('Troco: R\$${troco.toStringAsFixed(2)}');
  }
}
