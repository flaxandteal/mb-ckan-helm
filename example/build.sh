#!/bin/bash

source $CKAN_VENV/bin/activate && cd $CKAN_VENV/src/

ENVVARS_GIT_URL=https://github.com/okfn/ckanext-envvars
ENVVARS_GIT_BRANCH=0.0.1
S3FILESTORE_GIT_URL=https://github.com/keitaroinc/ckanext-s3filestore
S3FILESTORE_GIT_BRANCH=efd5711

pip install wheel
pip install git+${ENVVARS_GIT_URL}@${ENVVARS_GIT_BRANCH}#egg=ckanext-envvars
pip install git+${S3FILESTORE_GIT_URL}@${S3FILESTORE_GIT_BRANCH}#egg=ckanext-s3filestore
pip install -r https://raw.githubusercontent.com/keitaroinc/ckanext-s3filestore/${S3FILESTORE_GIT_BRANCH}/requirements.txt
curl -o /tmp/s3filestore.txt https://raw.githubusercontent.com/keitaroinc/ckanext-s3filestore/${S3FILESTORE_GIT_BRANCH}/requirements.txt
pip install -r /tmp/s3filestore.txt

git clone https://github.com/lintol/ckanext-oauth2provider
cd ckanext-oauth2provider
pip install -r dev-requirements.txt
python setup.py install
python setup.py develop
cd ..

git clone https://github.com/ckan/ckanext-scheming.git
cd ckanext-scheming
pip install -r requirements.txt
python setup.py install
python setup.py develop
cd ..

git clone https://github.com/lintol/ckanext-validation.git
cd ckanext-validation
git checkout feature/lintol
rm -rf ckanext/validation/fanstatic/vendor/lintol-reporting-ui
git clone https://github.com/lintol/lintol-reporting-ui ckanext/validation/fanstatic/vendor/lintol-reporting-ui
pip install -r requirements.txt
pip install -r lintol-requirements.txt
python setup.py install
python setup.py develop
cd ..

git clone https://${GITHUB_TOKEN}:x-oauth-basic@github.com/dkayee/ckanext-medicallybame.git
cd ckanext-medicallybame
pip install -r requirements.txt
python setup.py install
python setup.py develop
cd ..
