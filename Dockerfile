FROM nginx:alpine

# Instala utilitarios do Apache (contem htpasswd para Basic Auth)
RUN apk add --no-cache apache2-utils

# Copia todos os arquivos estaticos do projeto para o Nginx
COPY . /usr/share/nginx/html

# Copia os arquivos de configuracao do Nginx e script do container
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh /entrypoint.sh

# Permite execucao do script de inicializacao
RUN chmod +x /entrypoint.sh

# Expoem a porta padrao do Nginx
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
