$sub_total = 0.0

$lista_produtos = [
    {
        :"produto" => "PRODUTO A", 
        :"valor" => 50.00
    },
    {
        :"produto" => "PRODUTO B", 
        :"valor" => 200.00
    },
    {
        :"produto" => "PRODUTO C", 
        :"valor" => 100.00
    }
]

# Função para escolha de qual item será comprado nesse momento de execução.
def escolha()
    puts"\n\n"
    puts "[1] #{$lista_produtos[0][:produto]}: R$ #{$lista_produtos[0][:valor]}"
    puts "[2] #{$lista_produtos[1][:produto]}: R$ #{$lista_produtos[1][:valor]}"
    puts "[3] #{$lista_produtos[2][:produto]}: R$ #{$lista_produtos[2][:valor]}"
    
    # Necessário diminuir em -1 para que se ajuste a posição no vetor lista_produtos em 
    # em relação a escolha do cliente.
    escolha = (gets.chomp.to_i) - 1
    
    print "\nDigite a quantidade desejada: "
    qtd = gets.chomp.to_i 
    
    $compra_lambda.call(escolha, qtd)
end

# Função para atualização do valor subtotal.
$compra_lambda = -> (escolha, qtd) {
    puts"\n\n"
    $sub_total = $sub_total + ($lista_produtos[escolha][:valor] * qtd)
    
    puts "Subtotal: R$ #{$sub_total}\n\n"
    
    print "Digite 0 para voltar ao menu inicial : "
    entrada = gets.chomp.to_i
    puts"\n\n"
}

# Inicio da programa.
loop do
    puts "[1] COMPRAR"
    puts "[2] SAIR"
    opcao = gets.chomp.to_i

    case opcao
    when 1
        escolha()
        
    when 2
        puts "\n\nObrigado pela preferência, volte sempre.\n\n"
        break
    end
end






