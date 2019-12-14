#!/bin/sh

exec 2> cromai.log     #Envia os erros do software para arquivo cromai.log

verificaPID(){        #Verifica existência programa python3 ativo e compara seu PID com PID lido pid.txt

	ID=$(cat pid.txt)                                   #Lê pid.txt e guarda na variável ID
	pid=$(ps ax | grep python3 | awk '{print $1}')      #Verifica existência programa python3 ativo e guarda seu PID na variável pid

	for id in $pid; do                                  #Olha cada PID de programa python3 ativo encontrado
		if test $id -eq $ID; then                   #Testa se PID lido em pid.txt é igual a algum PID de programa python3 ativo
			echo "1: It is alive."              #Imprime na tela "1: It is alive"
			break                               #Para estrutura de repetição
		fi
	done
	if test $id -ne $ID;then                            #Testa se PID lido em pid.txt não é igual a algum PID de programa python3 ativo
		echo "1: It is dead."                       #Imprime na tela "1: It is dead"
		python3 script.py                           #Roda script em python3
		verificaPID                                 #Chama a função verificaPID
	fi
}

test -f pid.txt                  #Testa se existe arquivo pid.txt (se sim resposta igual a 0)
if [ $? -eq 0 ]                  #Testa se a resposta do teste é igual a 0
then
	verificaPID              #Chama a função verificaPID
else                             #Se resposta do teste diferente de 0
	echo "0" > pid.txt       #Cria pid.txt e escreve 0 nele
	verificaPID              #Chama a função verificaPID
fi

