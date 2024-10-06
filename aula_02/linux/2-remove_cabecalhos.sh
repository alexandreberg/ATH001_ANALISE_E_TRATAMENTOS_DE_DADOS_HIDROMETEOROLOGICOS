#!/bin/bash
# Remove as 8 primeiras linhas dos cabeçalhos dos arquivos.
#
# Para executar: No terminal do Linx rode:
# . 2-remove_cabecalhos.sh
# Os arquivos brutos do INMET para conversão devem estar na pasta: INMET_ATH_historico_bruto

# Diretório com os arquivos a serem processados
diretorio_origem="./INMET_ATH_historico_bruto/"

# Diretório de destino para os arquivos sem cabeçalho
diretorio_destino="./INMET_ATH_historico_bruto_SEM_CABECALHO/"

# Cria o diretório de destino se ele não existir
mkdir -p "$diretorio_destino"

# Encontra todos os arquivos regulares no diretório de origem
find "$diretorio_origem" -type f -print0 | while IFS= read -r -d $'\0' arquivo; do
    # Extrai o nome do arquivo
    nome_arquivo=$(basename "$arquivo")

    # Usa tail para remover as 8 primeiras linhas e salva no diretório de destino
    tail -n +9 "$arquivo" > "$diretorio_destino/$nome_arquivo"
done
