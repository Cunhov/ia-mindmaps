#!/bin/sh

if [ -n "$APP_USERNAME" ] && [ -n "$APP_PASSWORD" ]; then
    echo "Configurando protecao por senha (Basic Auth)..."
    # Cria o arquivo .htpasswd de forma segura
    htpasswd -db -c /etc/nginx/.htpasswd "$APP_USERNAME" "$APP_PASSWORD"
    # Substitui o placeholder no template e escreve na configuracao padrao do Nginx
    sed 's|#BASIC_AUTH#|auth_basic "Acesso Restrito"; auth_basic_user_file /etc/nginx/.htpasswd;|g' /etc/nginx/nginx.conf.template > /etc/nginx/conf.d/default.conf
    echo "Protecao por senha ativada para o usuario: $APP_USERNAME"
else
    echo "Iniciando sem protecao por senha (variaveis APP_USERNAME e APP_PASSWORD nao definidas)."
    # Apenas limpa a tag do template
    sed 's|#BASIC_AUTH#||g' /etc/nginx/nginx.conf.template > /etc/nginx/conf.d/default.conf
fi

# Inicia o Nginx em primeiro plano (necessario para o Docker)
exec nginx -g "daemon off;"
