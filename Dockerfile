FROM node:18-bullseye

# Instalar dependências do SHARP
RUN apt-get update && apt-get install -y \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./

RUN npm install --include=optional
COPY . .

EXPOSE 8080
CMD ["npm", "start"]
