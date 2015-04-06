#/bin/sh
#############################################################################+
# Description : Script to start/stop major hadoop stuff in  eco-system	     +
#		@args - No						                                                   +
#		@return - no significant				                                         +
#----------------------------------------------------------------------------+
# script		          ver author     date	change description	               +
#-------------------	--- ---------- -------- ------------------      	     +
# bigdata_console.sh	1.1 marikannan 04/06/15 initial version		             +
#############################################################################+

# initialize()
        export HADOOP_HOME=$HOME/BigDataInstall/hadoop
        export HBASE_HOME=$HOME/BigDataInstall/hbase
        export PHOENIX_HOME=$HOME/BigDataInstall/phoenix/hadoop1
        export HIVE_HOME=$HOME/BigDataInstall/hive

mainmenu() {
	printf "\t   Big Data Start/Stop Console\n"
	printf "\t   ---------------------------\n"
	printf "\t 1 ) Start Hadoop/MapReduce\n"
	printf "\t 2 ) Stop Hadoop/MapReduce\n"
	printf "\t 3 ) Start HBase\n"
	printf "\t 4 ) Stop HBase\n"
	printf "\t 5 ) Start HBase REST API\n"
	printf "\t 6 ) Stop HBase REST API\n"
	printf "\t 7 ) Start Phoenix\n"
	printf "\t 8 ) Stop Phonix\n"
	printf "\t 9 ) Start Hive MetaStore\n"
	printf "\t10 ) Stop Hive MetaStore\n"
	printf "\tq|x) Exit\n"
	echo
	printf "\t Enter option : "
	#read opt
}

start_hadoop() {
	rm -rf $HADOOP_HOME/logs/*
	rm -rf $HADOOP_HOME/data/*
	$HADOOP_HOME/bin/hadoop namenode -format
	$HADOOP_HOME/bin/start-all.sh
}

stop_hadoop() {
	$HADOOP_HOME/bin/stop-all.sh
}

start_hbase() {
	$HBASE_HOME/bin/start-hbase.sh
}

stop_hbase() {
 	$HBASE_HOME/bin/stop-hbase.sh	
}

start_hbaseRest() {
	bin/hbase rest start
}

stop_hbaseRest() {
	bin/hbase rest stop
}

start_phoenix() {
	$PHOENIX_HOME/bin/sqlline.py localhost
}

stop_phoenix() {
  	:	
}

start_hiveMetaStore() {
	$HIVE_HOME/bin/hive --service metastore &
}

stop_hiveMetaStore() {
	:
}

while :
    do
	mainmenu
	read opt
        case $opt in
                1) start_hadoop;;
                2) stop_hadoop;;
                3) start_hbase;;
                4) stop_hbase;;
                5) start_hbaseRest;;
                6) stop_hbaseRest;;
                7) start_phoenix;;
                8) stop_phoenix;;
                9) start_hiveMetaStore;;
                10) stop_hiveMetaStore;;
                q|Q|x|X) exit 0;;
        esac
	echo
	printf "Press enter to continue <Enter> "
	read dummy
done
