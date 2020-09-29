#!/bin/bash
# Copyright (c) 2015 Boomi, Inc.

wget $URL/atom/cloud_install64_no_jre.sh
chmod a+x cloud_install64_no_jre.sh
./cloud_install64_no_jre.sh -q -Vusername=${BOOMI_USERNAME} -Vpassword=${BOOMI_PASSWORD} -VatomName='${BOOMI_CONTAINERNAME}' \
  -VaccountId=${BOOMI_ACCOUNTID} -VcloudId=${BOOMI_CLOUDID} -VenvironmentId=${BOOMI_ENVIRONMENTID} \
  -VproxyHost=${PROXY_HOST} -VproxyUser=${PROXY_USERNAME} -VproxyPassword=${PROXY_PASSWORD} \
  -VproxyPort=${PROXY_PORT} -VlocalTempPath=${LOCAL_TEMP_PATH} -VlocalPath=${LOCAL_PATH} \
  -Vsys.symlinkDir=${SYMLINKS_DIR} -dir ${INSTALLATION_DIRECTORY} -VinstallToken=${INSTALL_TOKEN} \
  > ${ATOM_HOME}/install_Cloud_${DIRNAME}.log

# Setting the Cluster Network Transport Type to UNICAST
sh /home/boomi/override_properties.sh "com.boomi.container.cloudlet.clusterConfig=UNICAST" "${ATOM_HOME}/conf/container.properties"

# Setting the local storage to /opt/boomi/local
sh /home/boomi/override_properties.sh "com.boomi.container.localDir=/opt/boomi/local" "${ATOM_HOME}/conf/container.properties"

# Setting orchestrated container property to true.
sh /home/boomi/override_properties.sh "com.boomi.container.is.orchestrated.container=true" "${ATOM_HOME}/conf/container.properties"