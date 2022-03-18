## Como executar

Abra a pasta `ping_pong_api` e execute os comandos abaixo:

```bash
npm install
```

```bash
node index.js
```

Faça o build da imagem docker utilizando:

```bash
docker-composer build
```

Suba o container utilizando:

```bash
docker-composer up
```

Acesse `http://localhost:8081`

## Credênciais de acesso.

Para pegar as credênciais de acesso, você precisa acessar o seu container pela linha de comando utilizando:

```bash
docker exec -it <container_id> /bin/bash
```

Após acessar o container, você poder ver a sua senha utilizando o seguinte comando:

```bash
cat standalone_admin_password.txt
```
