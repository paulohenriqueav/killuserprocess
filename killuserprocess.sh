########################################################################
#                                                                      #
#   Arquivo: Mata Processos                   Data: 26/04/2017         #
#   Versão: 1.0                                                        #
#   Paulo Henrique de Andrade Vaz - Administrador de Redes             #
#             Script que mata os processos de todos os usuarios HPUX   #
#                                                                      #
#                                                                      #
#                                                                      #
#                                                                      #
#   Objetivo: Encerrar o processo de todos os usuarios                 #
#             Exclui o usuario root da execucao                        #
#             deste script                                             #
#                                                                      #
########################################################################

who -u | grep -v 'root' | awk {'print $1 " " $2'} > users_terminal

while read i; do
  a=$(echo $i | awk {'print $1'}) # Variavel $a -> usuario
  b=$(echo $i | awk {'print $2'}) # Variavel $b -> tty do usuário
  ps -u $a | grep $b | awk {'print $1'} > users_pid
  while read ii; do
    kill -9 $ii      
  done < users_pid
  rm -rf users_pid
done < users_terminal
rm -rf users_termina
