#!/bin/bash
senha="#Gfgrupo9"
root='root'

echo "[Bot assistente]: Configurando o Mysql... "
docker exec -it containerMysql bash -c "mysql -u$root -p$senha;
USE bdFluid; 
CREATE TABLE dado (idDado INT PRIMARY KEY AUTO_INCREMENT, usoEmPorcentagem DOUBLE, temperatura DOUBLE, dadoDateTime DATETIME DEFAULT CURRENT_TIMESTAMP, fkHardware INT, fkComputador INT);"

echo "[Bot assistente]: Configuração concluída"