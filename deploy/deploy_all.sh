#!/usr/bin/env bash

set +x

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

operator-sdk build $1 && \
docker push $1 && \
sed -e "s|REPLACE_IMAGE|$2|g" ${SCRIPTPATH}/operator.yaml | oc create -f - && \
oc create -f ${SCRIPTPATH}/service.yaml && \
oc create -f ${SCRIPTPATH}/crds/app_v1alpha1_appservice_cr.yaml
