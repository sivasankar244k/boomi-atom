#!/bin/bash
# Copyright (c) 2015 Boomi, Inc.

wget $URL/atom/atom_install64_no_jre.sh
chmod a+x atom_install64_no_jre.sh
./atom_install64_no_jre.sh -q -Vusername=${BOOMI_USERNAME} -Vpassword=${BOOMI_PASSWORD} -VatomName='${BOOMI_CONTAINERNAME}' \
  -VaccountId=${BOOMI_ACCOUNTID} -VenvironmentId=${BOOMI_ENVIRONMENTID} -VproxyHost=${PROXY_HOST} \
  -VproxyUser=${PROXY_USERNAME} -VproxyPassword=${PROXY_PASSWORD} -VproxyPort=${PROXY_PORT} \
  -Vsys.symlinkDir=${SYMLINKS_DIR} -dir ${INSTALLATION_DIRECTORY} -VinstallToken=${INSTALL_TOKEN} \
  > ${ATOM_HOME}/install_Atom_${DIRNAME}.log

# Setting orchestrated container property to true.
sh /home/boomi/override_properties.sh "com.boomi.container.is.orchestrated.container=true" "${ATOM_HOME}/conf/container.properties"