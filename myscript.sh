mkdir dockerdashyimg

cd dockerdashyimg/

git clone https://github.com/Lissy93/dashy

cd dashy/

rm Dockerfile
 
touch Dockerfile

echo -e "FROM node:lts-alpine3.14\n\n# постоянные переменные\nENV PORT=80 \\\nDIRECTORY=/app \\\nIS_DOCKER=true\n\n# Рабочая директория\nWORKDIR \${DIRECTORY}\n\n# Копируем файлы\n
COPY package.json yarn.lock ./\n\n# Устанавливаем зависимости\n
RUN yarn\n\n#Копируем все файлы и папку приложения\n
COPY . .\n\n# Выполняем сборку приложения\n
RUN yarn build\n\n# Указываем порт\n
EXPOSE \${PORT}\n\n# Запускаем приложение\n
CMD [ 'yarn', 'start']" >> Dockerfile

docker build -t dashyimg

docker run -p 8080:80 dashyimg
