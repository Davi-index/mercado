class Produto {
    constructor(nome, valor, validade) {
        this.nome = nome;
        this.valor = valor;
        this.validade = new Date(validade);
    }

    verificarValidade(dataAtual) {
        const dataAtualDate = new Date(dataAtual);
        if (this.validade < dataAtualDate) {
            const diferenca = Math.ceil((dataAtualDate - this.validade) / (1000 * 60 * 60 * 24));
            return `Produto ${this.nome} venceu há ${diferenca} dias.`;
        }
        return `Produto ${this.nome} está dentro da validade.`;
    }
}
// Lista de produtos
const listaProdutos = [
    new Produto("Arroz", 20.00, "2026-12-31"),
    new Produto("Feijão", 10.00, "2026-11-30"),
    new Produto("Macarrão", 5.00, "2026-10-15"),
    new Produto("Batata", 3.25, "2026-09-10"),
    new Produto("Tomate", 4.50, "2026-09-20"),
    new Produto("Cebola", 2.75, "2026-10-05"),
    new Produto("Alface", 1.50, "2026-09-25"),
    new Produto("Maçã", 3.00, "2026-10-01"),
    new Produto("Banana", 2.00, "2026-09-28"),
    new Produto("Leite", 4.00, "2026-09-30")
];
// Função principal
function caixaSupermercado(dataAtual, saldo, itensComprados) {
    let total = 0;
    let produtosComprados = [];

    itensComprados.forEach(item => {
        const produto = listaProdutos[item];
        console.log(produto.verificarValidade(dataAtual));
        total += produto.valor;
        produtosComprados.push(produto.nome);
    });

    console.log(`Total da compra: R$${total.toFixed(2)}`);

    if (total > saldo) {
        console.log(`Saldo insuficiente. Faltam R$${(total - saldo).toFixed(2)}.`);
    } else {
        console.log(`Compra realizada com sucesso! Troco: R$${(saldo - total).toFixed(2)}.`);
        console.log(`Produtos comprados: ${produtosComprados.join(", ")}`);
    }
}
// Exemplo de uso
let dataAtual = "2024-09-24";
let saldo = 50.00;
let itensComprados = [0, 1, 2]; 
// Índices dos produtos na lista
caixaSupermercado(dataAtual, saldo, itensComprados);
