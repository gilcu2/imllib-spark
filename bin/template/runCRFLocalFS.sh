#!/usr/bin/env bash

export SOURCEPATH=$HOME/prog/imllib-spark/

if [[ $DEBUG ]];then
    export SPARK_SUBMIT_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005
fi

rm -r $SOURCEPATH/target/model

spark-submit \
    --class CRFExample \
    --master local[*] \
    $SOURCEPATH/target/scala-2.11/imllib_2.11-0.0.1.jar \
    $SOURCEPATH/data/crf/template \
    file:///$SOURCEPATH/data/crf/serialized/train.data \
    file:///$SOURCEPATH/data/crf/serialized/test.data
