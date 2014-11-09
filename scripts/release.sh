#!/bin/bash
#
# Preps a release. Updates submodules, components, polyfills, and projects.
#
# Note: run from the root of the docs folder.
#
# Copyright 2014 Eric Bidelman <@ebidel>


# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update submodules =====
echo "=== Updating: submodules ==="
git submodule foreach git pull origin master

# Update site's bower_components deps. These get installed to /js/bower_components.
bower update

# Update components and polyfills folder =====
echo "=== Updating: components, polymer, polyfills, projects, and labs ==="

./polymer-all/tools/bin/pull-all.sh ./polymer-all/tools/repo-configs/deprecated.json ./scripts/website.json
# don't need the polymer projects. TODO: don't clone them in the first place
rm -rf projects
cp -R js/bower_components/highlightjs/ components/highlightjs
# override stock highlight with antha highlight
cp js/highlight.pack.js components/highlightjs/
cp -R js/bower_components/marked/ components/marked
cp -R js/bower_components/plunker-button/ components/plunker-button
cp -R js/bower_components/native-promise-only/ components/native-promise-only

echo "=== Updating webcomponent.js ==="
cd components/webcomponentjs/
npm install
gulp build
cp dist/webcomponents.min.js ../../js/
cd ../../

