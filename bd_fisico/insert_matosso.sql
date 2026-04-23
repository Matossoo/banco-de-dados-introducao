INSERT INTO cliente (nome_cliente, sobrenome_cliente, cpf_cliente, telefone_cliente, email_cliente, cidade_cliente, cep_cliente) VALUES 
('Virginia','do sul', '12345678901','40028922','virginia@hotmail.com','EUA','1234'),
('Carlos','Silva', '23456789012','11999990001','carlos@gmail.com','São Paulo','01001-000'),
('Ana','Souza', '34567890123','21988880002','ana@gmail.com','Rio de Janeiro','20000-000'),
('Pedro','Oliveira', '45678901234','31977770003','pedro@gmail.com','Belo Horizonte','30000-000'),
('Mariana','Costa', '56789012345','41966660004','mariana@gmail.com','Curitiba','80000-000');

INSERT INTO produto (nome_produto, descricao_produto, preco_produto, categoria_produto, marca_produto, codigo_barras, peso_produto, status_produto) VALUES
('Arroz 5kg','Arroz branco tipo 1',25.90,'Alimento','Tio João','1111111111111',5.00,'disponível'),
('Feijão 1kg','Feijão preto',8.50,'Alimento','Camil','2222222222222',1.00,'disponível'),
('Leite 1L','Leite integral',4.99,'Bebida','Piracanjuba','3333333333333',1.00,'disponível'),
('Detergente','Detergente líquido',2.50,'Limpeza','Ypê','4444444444444',0.50,'disponível'),
('Sabonete','Sabonete neutro',3.00,'Higiene','Dove','5555555555555',0.20,'indisponível');

INSERT INTO fornecedor (nome_fornecedor, cnpj_fornecedor, telefone_fornecedor, email_fornecedor, status_fornecedor) VALUES
('Fornecedor A','11111111000101','1133330001','fornecedorA@gmail.com','Ativo'),
('Fornecedor B','22222222000102','2133330002','fornecedorB@gmail.com','Ativo'),
('Fornecedor C','33333333000103','3133330003','fornecedorC@gmail.com','Inativo'),
('Fornecedor D','44444444000104','4133330004','fornecedorD@gmail.com','Ativo'),
('Fornecedor E','55555555000105','5133330005','fornecedorE@gmail.com','Bloqueado');

INSERT INTO venda (data_venda, valor_total, forma_pagamento, desconto_venda, id_cliente_na_tabela_venda, status_venda, observacoes_venda, caixa_venda) VALUES
('2026-01-10',34.40,'Cartão',0,1,'Concluída','Sem observações',1),
('2026-01-11',8.50,'Dinheiro',0,2,'Concluída','',1),
('2026-01-12',4.99, 'Pix',0,3,'Concluída','',2),
('2026-01-13',2.50,'Cartão',0,4,'Cancelada','Cliente desistiu',2),
('2026-01-14',3.00,'Dinheiro',0,5,'Concluída','',1);

INSERT INTO item_venda (id_venda, id_produto, quantidade_item, preco_item, subtotal_item, imposto_item, observacao_item) VALUES
(1,1,1,25.90,25.90,1.50,''),
(1,2,1,8.50,8.50,0.50,''),
(2,2,1,8.50,8.50,0.50,''),
(3,3,1,4.99,4.99,0.30,''),
(4,4,1,2.50,2.50,0.20,'');

INSERT INTO estoque (id_produto, quantidade_estoque, quantidade_minima_estoque, localizacao_estoque, data_hora_entrada, data_hora_saida, lote, validade, status_estoque) VALUES
(1,50,10,'A1','2026-01-01 08:00:00','2026-01-10 10:00:00','L001','2026-12-31','OK'),
(2,30,5,'A2','2026-01-02 08:00:00','2026-01-11 10:00:00','L002','2026-11-30','OK'),
(3,40,10,'B1','2026-01-03 08:00:00','2026-01-12 10:00:00','L003','2026-10-30','OK'),
(4,20,5,'B2','2026-01-04 08:00:00','2026-01-13 10:00:00','L004','2027-01-01','OK'),
(5,10,3,'C1','2026-01-05 08:00:00','2026-01-14 10:00:00','L005','2026-09-30','Baixo');

INSERT INTO pagamento (id_venda, tipo_pagamento, valor_pagamento, data_pagamento, parcelas_pagamento, imposto_pagamento, bandeira_pagamento, observacao_pagamento) VALUES
(1,'Cartão',34.40,'2026-01-10 10:00:00',1,1.50,'Visa',''),
(2,'Dinheiro',8.50,'2026-01-11 11:00:00',1,0.50,'pagamento sem cartão',''),
(3,'Pix',4.99,'2026-01-12 12:00:00',1,0.30,'pagamento sem cartão',''),
(4,'Cartão',2.50,'2026-01-13 13:00:00',1,0.20,'Mastercard',''),
(5,'Dinheiro',3.00,'2026-01-14 14:00:00',1,0.10,'pagamento sem cartão','');