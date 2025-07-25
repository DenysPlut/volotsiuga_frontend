FROM node:20

# Робоча директорія
WORKDIR /app

# Копіюємо залежності
COPY package*.json ./

# Встановлюємо залежності
RUN npm install

# Копіюємо решту проєкту
COPY . .

# Збірка фронтенду
RUN npm run build

# Встановлюємо продакшн-сервер
RUN npm install -g serve

# Відкриваємо порт (але важливо, щоб serve слухав саме цей порт)
EXPOSE 8882

# Запускаємо сервер на порту 8882
CMD ["serve", "-s", "build", "-l", "8882"]
