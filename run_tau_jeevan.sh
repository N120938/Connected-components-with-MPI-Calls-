#!/bin/sh
#to setup tau in jeevan's account 

if [ $# -ne 4 ]
then 
	echo "given #arguments : "$#" , expected #arguments : 5"
	echo "Usage :: script_name np dataset #edges #vertices"
	exit
fi

rm a.out 1>&2 2>/dev/null


#remove all the profile files
rm profile*


#compile with tau
~/mar29/Mar29/tau/bin/tau_cc.sh src.c

#set the path for tau
export PATH=~/mar29/Mar29/tau/bin:$PATH


#number of processes
np=$1
datasetPath=$2
edges=$3
verts=$4

mpiexec -n $np -f hostfile ./a.out $datasetPath  $edges $verts
