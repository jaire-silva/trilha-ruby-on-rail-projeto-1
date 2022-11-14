$sub_total = 0.00

$lista_produtos = [
    {
        :"produto" => "PRODUTO A", 
        :"valor" => 50.00,
        :quantidade =>0
    },
    {
        :"produto" => "PRODUTO B", 
        :"valor" => 200.00,
        :quantidade =>0
    },
    {
        :"produto" => "PRODUTO C", 
        :"valor" => 100.00,
        :quantidade =>0
    }
]

# Função para escolha de qual item será comprado nesse momento de execução.
def escolha()

    escolha = -1
    
    until (0..2) === escolha
        
        system("clear")
        puts "[1] #{$lista_produtos[0][:produto]}: R$ #{$lista_produtos[0][:valor]}"
        
        puts "[2] #{$lista_produtos[1][:produto]}: R$ #{$lista_produtos[1][:valor]}"
        puts "[3] #{$lista_produtos[2][:produto]}: R$ #{$lista_produtos[2][:valor]}"
        
        # Necessário diminuir em -1 para que se ajuste a posição no vetor lista_produtos em 
        # em relação a escolha do cliente.
        print "\nEscolha um produto: "
        escolha = (gets.chomp.to_i) - 1
        
        unless (0..2) === escolha
            puts "Opção invalida"
            sleep(1)
            redo    
        end

        print "\nDigite a quantidade desejada: "
        
        qtd = gets.chomp 
        
        if qtd.match(/\D/)
            puts "Opção invalida"
            sleep(1)
            redo
       else 
            qtd = qtd.to_i
       end
    end
        
        

    $compra_lambda.call(escolha, qtd)
end

# Função para atualização do valor subtotal.
$compra_lambda = -> (escolha, qtd) {
    # Atualiza o valor do subtotal.
    $sub_total = $sub_total + ($lista_produtos[escolha][:valor] * qtd)

    # Atualiza a quantidade de cada item escolhido.
    $lista_produtos[escolha][:quantidade] += qtd

    begin
        system("clear")
        
        puts "Subtotal: R$ #{$sub_total}\n\n"
        
        print "Digite 0 para voltar ao menu inicial : "
        entrada = gets.chomp

        raise if entrada.to_i != 0 or entrada.match(/\D/)
        
    rescue => exception
        system("clear")
        puts "Por favor escolha uma opção valida"
        sleep(1)
        retry
    end
}

# Função para listar os itens comprados
def listar_compras()
    $lista_produtos.each{
        |item|

        if item[:quantidade] > 0
            puts "produto #{item[:produto]} | valor R$ #{item[:valor]} | quantidade #{item[:quantidade]}"
        end
    }
    puts "\n\n\t\t\tTotal a pagar R$ #{$sub_total}"
end

# Inicio da programa.
loop do
    system("clear")
    puts "[1] COMPRAR"
    puts "[2] SAIR"
    opcao = gets.chomp.to_i

    case opcao
    when 1
        escolha()
        
    when 2
        system("clear")
        
        listar_compras() if $sub_total > 0

        puts "\n\nObrigado pela preferência, volte sempre."
        break
    end
end






