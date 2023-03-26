# MySQL 8 con Docker

Instrucciones para arrancar una base de datos MySQL 8 en local mediante Docker.

## Prerrequisitos

1. Instalar Docker Desktop para [Windows y macOS](https://www.docker.com/products/docker-desktop/)
   o [Linux](https://docs.docker.com/desktop/linux/install/).

2. En Windows, instalar [Scoop](https://scoop.sh) usando PowerShell:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
   Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
   ```

   Y después instalar los comandos necesarios:

   ```powershell
   scoop install make
   ```

3. Clonar este repositorio:

   ```shell
   git clone https://github.com/ijaureguialzo/mysql8.git
   ```

   > Si el comando anterior no funciona, habrá que [instalar Git](https://git-scm.com/downloads) en el sistema.

## Arrancar la base de datos

1. En un terminal, situarse en la carpeta `mysql8` (o si se ha renombrado, la que contenga este archivo `README.md`):

   ```shell
   cd mysql8
   ```

2. Copiar el fichero `env-example` a `.env`:

   En macOS y Linux:

   ```shell
   cp env-example .env
   ```

   En Windows:

   ```shell
   copy env-example .env
   ```

   > Es recomendable cambiar las contraseñas por defecto definidas en el fichero `.env`.

3. Arrancar los servicios:

   ```shell
   make start
   ```

   > Si al arrancar da errores porque los puertos están ocupados, se pueden elegir otros editando el fichero `.env`.

4. Cuando haya arrancado (tarda unos minutos) se puede administrar el servidor
   mediante [phpMyAdmin](https://localhost:8080).

## MySQL Workbench

La base de datos expone el puerto 3306 en localhost y para conectar
desde [MySQL Workbench](https://www.mysql.com/products/workbench/):

![](conexion.png)
