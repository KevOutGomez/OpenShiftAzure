# Instalación de Ansible
Para llevar a cabo la instalación de **Ansible** ejecutamos el comando
```bash
sudo yum install ansible
```
**NOTA**: La instalación de *ansible* puede ser en más de un servidor.

Una vez finalizada la instalación configuramos el archivo ubicado en **/etc/ansible/hosts**. En este archivo se indican los servidores en los cuales se ejecutarán los comandos remotamente.
Es necesario añadir un grupo y en él indicar los servidores remotos, la sintáxis es la siguiente:

```bash
[Nombre del grupo]
<alias del servidor> asible_ssh_host = <direccion ip del servidor> ansible_ssh_user = <usuario> ansible_become = true
```
Donde:
* **< alias del servidor >**: Es el nombre con el que identificaremos al servidor.
* **< direccion ip del servidor >**: Es la dirección IP del servidor.
* **< usuario >**: Es el usuario con el que se conectará Ansible al servidor.
* ansible_become: Indica que la ejecución de todos los comandos debe ser en usuario **root**

Un ejemplo de la estructura del archivo anterior es la siguiente:
```bash
# This is the default ansible 'hosts' file.
#
# It should live in /etc/ansible/hosts
#
#   - Comments begin with the '#' character
#   - Blank lines are ignored
#   - Groups of hosts are delimited by [header] elements
#   - You can enter hostnames or ip addresses
#   - A hostname/ip can be a member of multiple groups

# Ex 1: Ungrouped hosts, specify before any group headers.

## green.example.com
## blue.example.com
## 192.168.100.1
## 192.168.100.10

# Ex 2: A collection of hosts belonging to the 'webservers' group

## [webservers]
## alpha.example.org
## beta.example.org
## 192.168.1.100
## 192.168.1.110

# If you have multiple hosts following a pattern you can specify
# them like this:

## www[001:006].example.com

# Ex 3: A collection of database servers in the 'dbservers' group

## [dbservers]
## 
## db01.intranet.mydomain.net
## db02.intranet.mydomain.net
## 10.25.1.56
## 10.25.1.57

# Here's another example of host ranges, this time there are no
# leading 0s:

## db-[99:101]-node.example.com

[Openshift]

Nodo1  ansible_ssh_host=10.100.1.6   ansible_ssh_user='ansible' ansible_become=true
Nodo2  ansible_ssh_host=10.100.1.5   ansible_ssh_user='ansible' ansible_become=true
Nodo3  ansible_ssh_host=10.100.1.7   ansible_ssh_user='ansible' ansible_become=true
Servicios  ansible_ssh_host=10.100.1.8   ansible_ssh_user='ansible' ansible_become=true
Balanceador  ansible_ssh_host=10.100.1.9   ansible_ssh_user='ansible' ansible_become=true
Master ansible_connection=local
```
**NOTA**: La línea *Master ansible_connection=local* indica que los comandos también serán ejecutados en el servidor donde esta instalado ansible, para nuestro caso es el **Master**.

## Creación de llave
Seguido de la instalación de Ansible, es necesario crear una llave para su posterior conexión vía ssh con los demas servidores.

Primero creamos un usuario llamado **ansible** con el siguiente comando:
```bash
sudo useradd ansible
```
Enseguida nos logeamos como el usuario previamente creado:
```bash
sudo su ansible
```
Una vez logueados generamos la llave con el siguiente comando:
```bash
ssh-keygen -t rsa -b 4096
```
Sin escribir nada, damos enter en cada una de las opciones para obtener al final dos archivos llamados *id_rsa* e *id_rsa.pub* ubicados en el directorio **/home/ansible/.ssh**.
Con esto la llave habra sido creada.

Posterior a la creación de la llave es preciso evaluarla y añadirla, dichas operaciones las hacemos con los siguientes comandos:
```bash
sudo su -
eval $(ssh-agent -s)
ssh-add /home/ansible/.ssh/id_rsa
```
**NOTA**: Los comandos anteriores siempre hay que ejecutarlos antes de utilizar ansible.

## Alta de Ansible en los servidores
Para dar de alta al usuario ansible en todos los servidores, ejecutamos en cada uno, los comandos siguientes:
```bash
useradd -m -g operaciones ansible 
mkdir -p /home/ansible/.ssh/ 
touch /home/ansible/.ssh/authorized_keys
chmod 700 /home/ansible/.ssh/
chmod 600 /home/ansible/.ssh/authorized_keys 
echo ' < llave publica >' > /home/ansible/.ssh/authorized_keys
chown ansible:operaciones /home/ansible/ -R 
echo 'ansible  ALL=(ALL)      NOPASSWD: ALL' >> /etc/sudoers
```
Donde:
* **< llave publica >**: Es el contenido que tiene el archivo *id_rsa.pub* creado en pasos anteriores.

**NOTA**: Para el ejemplo anterior es necesario tener creado el grupo llamado **operaciones**.

## Prueba de Ansible
Para probar que ansible corre perfectamente, nos ubicamos en el servidor donde fue instalado Ansible y ejecutamos el comando:
```bash
ansible [grupo] -m ping
```
**NOTA**: En [grupo] colocamos el nombre del grupo creado en el archivo **/etc/ansible/hosts**
