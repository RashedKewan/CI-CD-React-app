# from this FROM command and everything under it till the next FROM,all goiing to be referred t as a builder phase
# Purpose : install dependences and build our application. 
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80

# > docker build -t kewanrashed/react .
# > docker run -p 8080:80 kewanrashed/react
