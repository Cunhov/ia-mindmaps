FROM nginx:alpine

# Copia os arquivos estáticos do projeto para a pasta do Nginx
COPY . /usr/share/nginx/html

# Expõe a porta padrão do servidor web
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
