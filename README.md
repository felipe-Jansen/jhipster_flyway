# jhipster_flyway

O JHipster é um gerador de projetos, ele gera a base de dados utilizando uma ferramnenta de migação chamada Liquibase. Durante muito tempo, eu tenho tido problemas com essa ferramenta, pois sempre que eu queria gerar novas tabelas ou atributos, eu me deparava com um erro de incompatibilidade do banco de dados de desenvolvimento e o de produção,a solução, tirei o Liquibase e coloquei no ligar o Flyway, que utiliza Sql Puro para migrar a base de dados, enquanto o Liquibase utiiza XML.

# Executando
    - Baixe uma cópia no seu computador
    - Inicialize a base de dados, vá até a pasta Docker e rode "sudo docker-compose -f postgre.yml up"
    - Inicialize a API (./mvnw)
    - Inicialize o Frontend (npm start)
