# !/bin/bash
# Script para la instalación de Docker y Montar volumenes en los servidores
# Se actualizan los repos.
yum update -y
# Instalación de paquetes
yum install -y libselinux-python xinetd docker

cd /

# Certificados de REDHAT y la CA del registry de AMX

echo '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' | base64 -w0 -d | tar xz -C /

# Modificamos el demonio de Docker para que cuando se caiga no tiré los contenedores

echo 'ewogICJsaXZlLXJlc3RvcmUiOiB0cnVlCn0K' | base64 -w0 -d > /etc/docker/daemon.json

# Regresamos a la raíz

cd /

# NOTA: Antes de ejecutar esto, deben haber tomado la clase de LVMS y VG.
# En este punto deben de tener un VG llamado datavg1 sobre el disco adicional que yo les monté.
# Usando en el comando "pvs" para verificar. Si no está, ejecuten el siguiente comando:

vgcreate datavg1 /dev/sdc

# Ahora bien, acá no vamos a persistir la data sobre /var/containers debido a que es Open Shift. Deben buscar en qué directorios guarda OS su magia y crear LVMS sobre esos directorios. Si fallan a hacer esto, se van a quedar sin espacio en OS (Open Shift) y se va a caer.

# Vamos a crear el archivo de configuración.

echo 'H4sIAEXZl1gAA+3SQW/aMBgGYM7+FVHutA4EesohIlaIgDgyDlS7WBkxCA0aZAek7tfPUNpKY2oPPWyT3ufixO/3xXZk3a7u7bNdNU/r7ea+blY/tOnatjHVRnetbo+HzpdRZxiGl9H5fXQZ7QR9Gg4eBmE4fOjQYNh35R79+tKfO9q2Mp7XMU3TflT3Wf6fmksu4pSpRGQLJiK/1qftSu+rw0Ebn7BHKWKV8NGECfVayguZ8Xwe+d23i9IcWq/e3x2tVrVea2N0rYzeN6dqF7XmqL2b0u+V1Xb7U0d9mnp/iHfuJl7yQdCb+GSRuq1VbXXaBD5JYhmrefaNuWaaklmWq/epXkpG4zKfvLydu0kq+LKIhYzW1c5qEpeSK3cylieq4HwaPWtLzg/qnFwDORZsPubTJBrSm7BgYsRyGfUoSdgiGzG1jDOpZDZjvJTnjmVWMLeDNI9l6T50Xfn6IwXnUi34tJyxy9q30y+bD9zh/vb9AAAAAAAAAAAAAAAAAAAAAACAf9cv6eleLwAoAAA=' | base64 -w0 -d  | tar xzv -C /

#echo 'Vkc9ImRhdGF2ZzEiCkRBVEFfU0laRT0xMEcKTUlOX0RBVEFfU0laRT0yRwpDSFVOS19TSVpFPTUxMksKR1JPV1BBUlQ9ZmFsc2UKQVVUT19FWFRFTkRfUE9PTD15ZXMKUE9PTF9BVVRPRVhURU5EX1RIUkVTSE9MRD04MApQT09MX0FVVE9FWFRFTkRfUEVSQ0VOVD0yMApERVZJQ0VfV0FJVF9USU1FT1VUPTYwCldJUEVfU0lHTkFUVVJFUz1mYWxzZQpET0NLRVJfUk9PVF9WT0xVTUU9eWVzCkRPQ0tFUl9ST09UX1ZPTFVNRV9TSVpFPTIwRwo=' | base64 -w0 -d > /etc/sysconfig/docker-storage-stup

# MODIFIQUEN el archivo "/etc/sysconfig/docker-storage-setup". Este archivo describe cómo se va a comportar DOCKER. BUSQUEN en la documentación de OS cuál es la configuración de los LVMS de docker (pool y root) que deben usar.

# El archivo tiene los siguientes comandos:

#STORAGE_DRIVER="devicemapper" <== tipo de driver de storage de Docker
#EXTRA_DOCKER_STORAGE_OPTIONS="--storage-opt dm.use_deferred_removal=true --storage-opt dm.basesize=30G  --storage-opt dm.blocksize=512K" <== algunas opciones que usamos para mejorar el rendimiento
#VG="datavg1" <=== el nombre del VG
#DATA_SIZE=300G <=== EL TAMAÑO de Docker POOL. Lo normal son 10 GB.... no dejen 300 GB salvo que la documentación se los diga...
#MIN_DATA_SIZE=2G <=== Tamaño mínimo
#CHUNK_SIZE=512K  <=== no lo pelen
#GROWPART=false <=== no lo pelen
#AUTO_EXTEND_POOL=yes <==== cuando llegamos a cierto umbral, autoextendemos el docker pool
#POOL_AUTOEXTEND_THRESHOLD=80 <=== el umbral para crecerlo
#POOL_AUTOEXTEND_PERCENT=20 <=== cuánto lo crecemos
#DEVICE_WAIT_TIMEOUT=60 <=== cuánto esperamos antes de declarar muerto el HDD
#WIPE_SIGNATURES=false
#DOCKER_ROOT_VOLUME=yes
#DOCKER_ROOT_VOLUME_SIZE=10G <=== el tamaño del docker root (donde se guardan las imágenes)

# Ya que configuraron todo de acuerdo a la documentación. Ejecuten el siguiente comando:

docker-storage-setup

# Habilitamos Docker para que systemd lo inicie cuando inicie la VM

systemctl enable docker

# Iniciamos Docker

systemctl start docker

echo '/dev/mapper/datavg1-docker--root--lv /var/lib/docker                    xfs    defaults        0 0' >> /etc/fstab
# Por si se bate el servidor :D
# vgremove <nombre del volume group> Antes de ejecutar este comando hay que verificar que no este montado el volumen logico.
# pvremove /dev/< nombre del physical volume >
