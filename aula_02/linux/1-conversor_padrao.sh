#!/bin/bash
# Conversor de padrão de arquivos.
# Converte as virgulas para pontos e depois os pontos para ponto e virgula.

# Para executar: No terminal do Linx rode:
# . 1-conversor_padrao.sh
# Os arquivos brutos do INMET para conversão devem estar na pasta: INMET_ATH_historico_bruto

# Diretório com os arquivos a serem processados
diretorio="../INMET_ATH_historico_bruto/"

# Loop por todos os arquivos no diretório
for arquivo in "$diretorio"/*; do
  if [[ -f "$arquivo" ]]; then  # Verifica se é um arquivo regular
    # Usa sed para substituir ',' por '.' e ';' por ','
    sed -i 's/,/./g; s/;/,/g' "$arquivo" 
  fi
done
