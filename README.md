# <p align=center> Projeto de Banco de Dados da residência em TIC/Software Serratec 2021.2

Turma Petrópolis 007 - Grupo 5<br /><br />
Membros: Bruno Prata Dias, Guilherme Dideco Antunes, Igor Vicente Haubrich,<br /> Lucas Coelho Paulino, Lucas Ferreira Seixas e Luis Felipe Saldanha.<br /><br />
Data de entrega: 22/09/2021

# <p align=center>  Tarefas:

1. Diagrama ER (primeira versão) - imagem
2. Diagrama ER (depois da normalização) - imagem
Arquivo com os comandos:
  3. SQL de criação das tabelas (DDL)
  4. SQL de inserção de dados nas tabelas (pelo menos 5 registros em cada uma) (DML)
  5. Um comando SQL de atualização em algum registro em uma tabela (DML)
  6. Um comando SQL de exclusão de algum registro em uma tabela (DML)
  7. 5 SQLs de consulta<br />
    ↳ Pelo menos 2 com algum tipo de junção<br />
    ↳ Pelo menos 1 com usando count() e group by()<br />
    ↳ 1 SQL para construção de nota fiscal<br /> 
  

# <p align=center> Descrição do Projeto:

  
Opção 2: E-commerce marketplace

Uma plataforma deseja conectar usuários ques estão interessados em comprar e vender seus produtos. 
Para isso precisa de um sistema capaz de realizar o cadastro de usuários e o controle de estoque de seus produtos.
Sendo assim, a seguir são descritos os requisitos e os dados que a plataforma julga serem necessários para o funcionamento do sistema:<br />

• O sistema deve ser capaz de armazenar informações sobre os produtos vendidos, sendo eles: código, nome, descrição, quantidade em estoque,
data de fabricação e valor unitário e código do usuário vendedor.<br />
• Um produto é fornecido por um usuário do sistema, sendo assim, faz-se necessário o registro de informações deste usuário, como: código, nome,
endereço, telefone, nome de usuário, e-mail, cpf, data de nascimento.<br />
• Um usuário pode vender um ou mais produtos.<br />
• Ao cadastrar um produto no sistema, os usuários devem ser capazes de associá-lo à uma categoria. Cada produto só poderá pertencer à uma categoria.<br />
• Se o produto já estiver cadastrado no sistema, o usuário deverá apenas atualizar a quantidade de itens no estoque.<br />
• Para cada categoria de produto, é necessário registrar: código, nome e descrição.<br />
• Através do sistema, os usuários podem realizar pedidos de compra. Cada pedido deve conter um ou mais produtos, a data em que foi realizado e por
quem foi realizado e de quem ele está comprando.<br />
• Um pedido pode ter mais de um item de um mesmo produto, de acordo com a quantidade disponível em estoque entretanto apenas produtos do mesmo
vendedor.
