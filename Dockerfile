FROM node:16.17.0-alpine AS crashcourse

WORKDIR /todoapp
COPY . .

RUN npm install
RUN npm run build

RUN ls

FROM nginx
COPY --from=crashcoursebuild/ /user/share/nginx/html/