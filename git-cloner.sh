*****************************************************
# Download Specific folders from Github             *
# Author: spyd3r                                    *
# Website : glearner.github.io                      *
# Licence: MIT                                      *
*****************************************************
GHDOMAIN="https://github.com/"
IN=$1
IN=${IN##$GHDOMAIN}
BRANCH="trunk"
FOLDER=""
IFS="/" read -a SECT <<< "$IN" 

if [[ "${SECT[3]}" != "master" ]]; then
  BRANCH=${SECT[3]}
fi
for index in "${!SECT[@]}"; do
  if [ $index -gt 3 ]; then
    FOLDER=$FOLDER/${SECT[index]}
  fi
done

# DOMAIN/USER/PROJECT/<TRUNK||BRANCH>/FOLDER
echo Exporting $GHDOMAIN${SECT[0]}/${SECT[1]}/$BRANCH$FOLDER
cd ~
cd Des*
mkdir github
cd github
git svn clone $GHDOMAIN${SECT[0]}/${SECT[1]}/$BRANCH$FOLDER
