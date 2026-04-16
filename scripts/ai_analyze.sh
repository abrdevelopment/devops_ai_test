#!/bin/bash
set -e

LOG_FILE="$1"

echo "=============================="
echo "ANALISE ASSISTIDA POR IA"
echo "=============================="

if [ ! -f "$LOG_FILE" ]; then
  echo "Log não encontrado"
  exit 0
fi

if grep -qi "database" "$LOG_FILE"; then
  echo "Causa provável   : Indisponibilidade de banco de dados"
  echo "Categoria        : Infraestrutura / Rede"
  echo "Ação recomendada :"
  echo " - Verificar se o host db01 está ativo"
  echo " - Checar firewall e rotas"
  echo " - Validar serviço do banco"
elif grep -qi "permission denied" "$LOG_FILE"; then
  echo "Causa provável   : Erro de permissões"
  echo "Categoria        : Aplicação / Segurança"
else
  echo "Causa provável   : Erro não classificado"
fi

echo "=============================="