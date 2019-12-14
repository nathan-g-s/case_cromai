#importa as bibliotecas necessárias para execução
import os
import subprocess
import time

pid = os.getpid()                 #identifica PID do seu próprio processo

arquivo = open('pid.txt', 'w')    #abre arquivo pid.txt
arquivo.write(str(pid))           #escreve em pid.txt o seu PID
arquivo.close()                   #fecha arquivo pid.txt

for i in range(0, 3):                              #Executa comandos 3 vezes
	print("2: I am alive.")                    #Imprime na tela "2: I am alive"
	subprocess.Popen(["sh", "script.sh"])      #Chama shell script
	time.sleep(3)                              #Pausa por 3 segundos

print ("2: I gonna die now, bye.")                 #Imprime na tela "2: I gonna die now, bye"
