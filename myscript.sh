mkdir DockerDashyImg

cd DockerDashyImg/

git clone https://github.com/Lissy93/dashy

cd dashy/

rm Dockerfile
 
touch Dockerfile

echo -e 'FROM node:lts-alpine3.14

# постоянные переменные
ENV PORT=80 \\
DIRECTORY=/app \\
IS_DOCKER=true

# Рабочая директория 
WORKDIR ${DIRECTORY} 

# Копируем файлы
COPY package.json yarn.lock ./  

# Устанавливаем зависимости
RUN yarn 

#Копируем все файлы и папку приложения 
COPY . .

# Выполняем сборку приложения
RUN yarn build

# Указываем порт 
EXPOSE ${PORT} 

# Запускаем приложение 
CMD [ "yarn", "start"]' >> Dockerfile

sudo docker build -t dashyimg .

sudo docker run -p 8080:80 dashyimg
