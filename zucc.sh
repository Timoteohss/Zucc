#!/bin/bash

#Cores
ciano='\e[0;36m'
verde='\e[0;34m'
verdeescuro='\033[92m'
verdeclaro='\e[1;32m'
branco='\e[1;37m'
vermelho='\e[1;31m'
amarelo='\e[1;33m'
azul='\e[1;34m'

#Variaveis
versao='0.11'
codenome='zuccsip'

trap ctrl_c INT
ctrl_c() {
clear
echo -e $vermelho"[*] Ctrl+C detectado, fechando..."
sleep 1
echo -e $branco"[*] Obrigado por utilizar o Zucc, sua privacidade será retornada..."
exit
}

if [[ $EUID -ne 0 ]]; then
	echo "Erro! Rode esse script com usuário root"
	exit 1
fi

if [ -z "${DISPLAY:-}" ]; then
    echo -e "\e[1;31mEste script deve ser utilizado em uma sessão gráfica."$transparent""
    exit 1
fi
resize -s 50 84 > /dev/null

clear

echo "[0;1;34;94m▗▄▄▖▗[0m  [0;1;34;94m▖[0m [0;34m▗▄[0m  [0;34m▗▄[0m "
echo "  [0;34m▐▘▐[0m  [0;34m▌▗▘[0m [0;34m▘▗▘[0m [0;34m▘[0m"
echo " [0;34m▗▌[0m [0;34m▐[0m  [0;34m▌[0;37m▐[0m   [0;37m▐[0m   "
echo " [0;37m▞[0m  [0;37m▐[0m  [0;37m▌▐[0m   [0;37m▐[0m   "
echo "[0;37m▐▙▄▖▝▄▄▘[0m [0;1;30;90m▚▄▘[0m [0;1;30;90m▚▄▘[0m"
echo -e $branco"\"Aqui sua privacidade não tem vez\""
echo -e $branco"+=[(c) 2018 | Ciência da Computação - UFT | versão $versao]=+"
echo -e $ciano"---<Autor: Timóteo Holanda da Silva Sousa>---"
echo -e " "

if [ $(id -u) != "0" ]; then

	echo [!]::[Verificando dependencias] ;
	sleep 1
	echo [✔]::[Verificando usuário]: $USER ;
	sleep 1
	echo [x]::[não root]: Você precisa ser um usuário [root] para utilizar esse script.;
	echo ""
	sleep 1
	exit


#Verifica usuário
else

echo [!]::[Verificando dependências]: ;
sleep 1
echo [✔]::[Verificando usuário]: $USER ;

fi

#Verifica conexão com a internet
ping -c 1 google.com > /dev/null 2>&1
if [ "$?" != 0 ]

then

	echo [✔]::[Conexão com a Internet]: PRONTO!;
	echo [x]::[Atenção]: Esse script precisa de uma conexão com a internet;
	sleep 1

else

	echo [✔]::[Conexão com a Internet]: conectado!;
	sleep 1
fi

#Verifica se o nmap está instalado
	which nmap > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
	echo [✔]::[nmap]: Instalação encontrada!;
else

echo [x]::[Atenção]: Este script precisa do Nmap;
echo ""
echo [!]::[Por favor aguarde]: instalando nmap .... ;
apt-get update
apt-get install nmap
echo ""
sleep 1
exit
fi
sleep 1

#Verifica se o dialog está instalado
	which dialog > /dev/numm 2>&1
	if [ "$?" -eq "0" ]; then
	echo [✔]::[dialog]: Instalação encontrada!;
else
	echo [x]::[Atenção]: Este script precisa do dialog;
	echo ""
	echo [!]::[Por favor aguarde]: instalando dialog .... ;
	apt-get update
	apt-get install dialog
	echo ""
	sleep 1
	exit
fi
sleep 1


function menuPrincipal() {

clear
echo "[0;1;34;94m▗▄▄▖▗[0m  [0;1;34;94m▖[0m [0;34m▗▄[0m  [0;34m▗▄[0m      [0;34m▄▄[0m  [0;37m▄▄[0m "
echo "  [0;34m▐▘▐[0m  [0;34m▌▗▘[0m [0;34m▘▗▘[0m [0;34m▘[0m    [0;37m▗▘▝▖▐▘[0m [0;37m▘[0m"
echo " [0;34m▗▌[0m [0;34m▐[0m  [0;34m▌[0;37m▐[0m   [0;37m▐[0m       [0;37m▐[0m  [0;37m▌[0;1;30;90m▝▙▄[0m "
echo " [0;37m▞[0m  [0;37m▐[0m  [0;37m▌▐[0m   [0;37m▐[0m       [0;1;30;90m▐[0m  [0;1;30;90m▌[0m  [0;1;30;90m▝▌[0m"
echo "[0;37m▐▙▄▖▝▄▄▘[0m [0;1;30;90m▚▄▘[0m [0;1;30;90m▚▄▘[0m     [0;1;30;90m▙▟[0m [0;1;34;94m▝▄▟▘[0m"
echo -e $branco"----------------------------<>v$versao"
echo -e " "
echo -e $branco"[$verdeclaro"01"$branco]$verdeescuro	Lista computadores com SSH na rede	"
echo -e $branco"[$verdeclaro"02"$branco]$verdeescuro	Listar computadores	"
echo -e $branco"[$verdeclaro"03"$branco]$verdeescuro	OP3	"
echo -e $branco"[$verdeclaro"04"$branco]$verdeescuro	OP4	"
echo -e $branco"[$verdeclaro"05"$branco]$verdeescuro	Opções	"

echo -n -e $vermelho'\033[4mUsuario@zuccos-v1:\033[0m '; tput sgr0 #insira sua escoha
read zucc

if test $zucc == '1'
	then
	echo -e $vermelho"[*] Digite as faixas de ip :"
	echo -n -e $vermelho'\033[4mUsuario@zuccos-v1:\033[0m '; tput sgr0 #insira sua escoha
	read ip

	echo -e $vermelho"[*] Digite o nome do arquivo a ser gerado :"
	echo -n -e $vermelho'\033[4mUsuario@zuccos-v1:\033[0m '; tput sgr0 #insira sua escoha
	read fname
	ftemp=".$fname"

	echo -e $vermelho"[*] Scaneando IPs..."
	nmap -p 22 --open -sV $ip | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" > output/$ftemp
	cat output/$ftemp

	echo ""
	echo -e $vermelho"[*] Qual o nome do Administrador das maquinas? "
	echo -n -e $vermelho'\033[4mUsuario@zuccos-v1:\033[0m '; tput sgr0 #insira sua escoha
	read super

	mkdir -p ~/.ssh
	while read line
	do
		ssh-keyscan $line >> ~/.ssh/known_hosts
	done < output/$ftemp

	while read line
	do
		echo "$super@$line" >> output/$fname
	done < output/$ftemp

	echo ""
	echo -e $vermelho"[*] Testando conexao com as maquinas..."
	> output/$ftemp
	pssh -h output/$fname -l root -A echo "ZuccTest" | grep -E "(\[[SUCESS]*\])" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >> output/$ftemp
	maquinas=$(wc -l output/$ftemp)

	echo -e $verde"[✔] Foram encontradas $maquinas onlines na rede."
	> output/$fname

	while read line
	do
		echo "$super@$line" >> output/$fname
	done < output/$ftemp
	

	rm output/$ftemp

	sleep 1
	menuPrincipal
elif test $zucc == '2'
	then
	cat output/ips
elif test $zucc == '3'
	then
	echo "Escolha 3"
elif test $zucc == '4'
	then
	echo "Escolha 4"
elif test $zucc == '5'
	then
	echo "1" >> output/settings
else
	echo "Escolha um abestado"
	sleep 1
	menuPrincipal
fi

}



menuPrincipal

#nmap -p 22 --open -sV ip | grep ^Nmap | sed -r 's/Nmap\ scan\ report\ for\ //'
