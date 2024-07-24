use lojatech;
#Inicio da função
DELIMITER //
#Função com apenas um argumento
CREATE FUNCTION testFunction(empt_name VARCHAR(50))
	#O retorno dela
	RETURNS VARCHAR(50)
    DETERMINISTIC
    #Espaço para implementar a lógica de negócio 
    BEGIN
		RETURN empt_name;
	END //
#Fim da função
DELIMITER ;

#Uso da função
select testFunction("GABRIEL");

DELIMITER //
#Função para adicionar um novo produto
CREATE FUNCTION adicionarProduto(
				nome VARCHAR(50), 
				marcaInsert VARCHAR(50), 
                valorInsert DECIMAL(5,2),
                qtdInsert INT)
	#O retorno
    RETURNS VARCHAR(50)
    DETERMINISTIC
	BEGIN
		INSERT INTO produto (nome_produto, marca, valor, qtd)
        VALUES
			(nome, marcaInsert, valorInsert, qtdInsert);
            RETURN "PRODUTO CADASTRADO!";
    END //
DELIMITER ;
#Drop de funções
DROP FUNCTION adicionarProduto;
select adicionarProduto('Cravos', 'GreenGarden', 20.00, 50);

