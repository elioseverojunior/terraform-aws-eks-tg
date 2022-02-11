#!/usr/bin/env bash

TFENV="${HOME}/.tfenv"
LOCAL_BIN="${HOME}/.local/bin/"
TFENV_VERSION="$1"
TF_VAR_git_short_code="$(git rev-parse --short HEAD)"

if [[ ! -d "${TFENV}" ]];
then
  git clone https://github.com/tfutils/tfenv.git ${TFENV}
  mkdir -p "${LOCAL_BIN}"
  ln -s ${TFENV}/bin/* ${LOCAL_BIN}
  sh -c "which tfenv"
fi

if [[ -z "$(tfenv list | grep "${TFENV_VERSION}")" ]];
then
  tfenv install "${TFENV_VERSION}"
  tfenv use "${TFENV_VERSION}"
fi

echo "git commit short: ${TF_VAR_git_short_code}"
export TF_VAR_git_short_code="${TF_VAR_git_short_code}"

