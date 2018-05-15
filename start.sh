#!/bin/bash
echo "======================================================="
echo "compila aplicacion"
mvn clean package -Dmaven.test.skip=true
echo "======================================================="
echo "======================================================="
echo "compila imagen docker - dk_receivermq_sap "
docker build -t dk_receivermq_sap .
echo "======================================================="
echo "======================================================="
echo "corre imagen del contenedor"
docker run \
 --name dk_receivermq_sap  \
 --net=backend \
 -it dk_receivermq_sap
echo "======================================================="
echo "======================================================="
echo "fin"


