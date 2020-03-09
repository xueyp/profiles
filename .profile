export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8
export XIM="fcitx"
export XIM_PROGRAM="fcitx"
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export EDITOR=vim
export JAVA_HOME=/usr/local/jdk
export SCALA_HOME=/usr/local/scala
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
export HBASE_HOME=/usr/local/hbase
export HIVE_HOME=/usr/local/hive
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SCALA_HOME/bin:$SPARK_HOME/bin:/usr/local/sbt/bin:/usr/local/cassandra/bin:/usr/local/kafka/bin:/usr/local/mongodb/bin:/usr/local/es/bin:$HBASE_HOME/bin:$HIVE_HOME/bin:/home/x/firefoxDriver:JAVA_HOME/bin:/usr/local/bin

alias vi="vim" alias xxnet="sudo /usr/local/XX-Net/start &"
alias ampps="sudo /usr/local/ampps/Ampps"
alias kali="ssh -X 192.168.56.2 -l root"
alias mycliL="mycli -u root -p 111111qQ -h 127.0.0.1 --local-infile 1"
alias pgcliL="pgcli -u postgres "

alias mongodbs="mongod --dbpath /home/x/mongodbdata/db --logpath /home/x/mongodbdata/logs"
alias elasticsearch="/usr/local/es/bin/elasticsearch"
alias logstash="/usr/local/logstash/bin/logstash -f /usr/local/logstash/config/logstash.conf"
alias kibana="/usr/local/kibana/bin/kibana"

alias starth="start-dfs.sh&&start-yarn.sh"
alias stoph="stop-yarn.sh&&stop-dfs.sh"

alias starts="/usr/local/spark/sbin/start-all.sh"
alias stops="/usr/local/spark/sbin/stop-all.sh"

alias starthbase="/usr/local/hbase/bin/start-hbase.sh&&/usr/local/hbase/bin/hbase shell"
alias stophbase="/usr/local/hbase/bin/stop-hbase.sh"

alias starthive="$HIVE_HOME/bin/hiveserver2& &&$HIVE_HOME/bin/beeline -u jdbc:hive2://localhost:10000"
alias zvpn="cd /home/x/.vpn && sudo openvpn --config /home/x/.vpn/base.ovpn"

alias sparksh="spark-shell --master spark://localhost:7077 --num-executors 3 --driver-memory 1g --executor-memory 1g --executor-cores 1"
export PYSPARK_DRIVER_PYTHON=jupyter 
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
alias pysparksh="pyspark --master spark://localhost:7077 --num-executors 3 --driver-memory 1g --executor-memory 1g --executor-cores 1"

alias xmr="cd ~/xmr-stak/build/bin/ && sudo ./xmr-stak"
alias startopenvas="sudo systemctl restart redis && sudo systemctl restart openvas-scanner && sudo openvasmd -p 9390 -a 127.0.0.1 && sudo gsad -f --listen=127.0.0.1 --mlisten=127.0.0.1 --mport=9390"

alias condas="source /usr/local/anaconda3/bin/activate root"
alias condae="conda deactivate "

export PATH="$HOME/.cargo/bin:$PATH"
