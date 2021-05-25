#!/bin/bash
senha="#Gfgrupo9"
root='root'

###
# Funções do script
###

instalar_java()
{
	echo "[Bot assistente]: Iniciando instalação da versão 11 do Java"
	echo "[Bot assistente]: Criando repositório..."
	sleep 2
	#sudo add-apt-repository ppa:webupd8team/java -y
	clear
	echo "[Bot assistente]: Atualizando pacotes..."
	sleep 2
	sudo apt update -y
	clear									
	echo "[Bot assistente]: Iniciando instalação, confirme solicitado ;"
	sudo apt install default-jre ; apt install openjdk-11-jre-headless;-y
	sudo apt install openjdk-11-jdk-headless;
	clear
	echo "[Bot assistente]: Instalação do Java concluida com sucesso!"
}


###
# Body do script
###
echo "[Bot assistente]: Bem-vindo ao auxiliar de instalação da solução Fluid"
echo "[Bot assistente]: Iniciando verificação de requisitos"
echo "[Bot assistente]: Verificando instalação do Java..."

var=$((java -version) 2>&1 | awk -F '"' '/version/ {print $2}')
echo $var
if [[ "$var" >"0" ]]
    then
		echo "Você possui o java instalado"    
        echo "[Bot assistente]: Buscando versão do Java..."
		echo $var
		
		if [[ "$var">"11" ]];		
			then
				echo "[Bot assistente]: Sua versão do Java é suficiente para nossa solução!"
				echo "[Bot assistente]: Prosseguindo com a verificação de requisitos..."
			else
				echo "[Bot assistente]: Seu Java está desatualizado"
				echo "[Bot assistente]: Deseja atualizá-lo? (s/n)"
				read resposta
				if [ \"$resposta\" == \"s\" ]
					then
					instalar_java
					else
						echo "[Bot assistente]: Atualização recusada, encerrando assistência..."
				fi
		fi
    
	else
    	echo "[Bot assistente]: Não foi encontrada nenhuma versão do Java"
		echo "[Bot assistente]: Deseja instalar o Java? (s/n)"
		read resposta
		
		if [[ \"$resposta\" == \"s\" ]]
			then
			instalar_java			
			else
				echo "[Bot assistente]: Instalação recusada, encerrando assistência..."
		fi					
fi

echo "[Bot assistente]: Criando repositório Fluid..."
mkdir /home/${USER}/Desktop/Fluid
echo "[Bot assistente]: Baixando arquvios..."
wget 'https://github.com/FelipeTHiga/SO2021/blob/3f8cf32da58b9f2279e33e8a86332649bfcc9d3c/Fluid.jar' -P /home/${USER}/Desktop/Fluid


echo "[Bot assistente]: Configurando o Docker... "
sudo apt update
sudo apt install docker.io

sudo systemctl start docker
sudo systemctl enable docker

echo "[Bot assistente]: Baixando imagem do Mysql "
sudo docker pull mysql:8.0.16

sudo chmod 666 /var/run/docker.sock

echo "[Bot assistente]: Criando imagem do Mysql..."

sudo docker run -d -p 3306:3306 --name containerMysql -e "MYSQL_DATABASE=bdFluid" -e "MYSQL_ROOT_PASSWORD=#Gfgrupo9" mysql:8.0.16

sleep 5

clear
echo "[Bot assistente]: Banco configurado"

