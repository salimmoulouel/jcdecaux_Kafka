#lancer zookeeper le gestionnaire de cluster
$KAFKA/bin/zookeeper-server-start.sh $KAFKA/config/zookeeper.properties 

#pour creer un topic
$KAFKA/bin/kafka-topics.sh --create --zookeeper localhost:2181 --topic velib-stations --partitions 1

#pour changer le nombre de partitions
$KAFKA/bin/kafka-topics.sh --alter --zookeeper localhost:2181 --topic velib-stations --partitions 10

#demarrer un serveur (brooker)
$KAFKA/bin/kafka-server-start.sh $KAFKA/config/server1.properties 

## lancer les producers et consumers (fichier python ou bien shell) 


#supprimer tous les dossier de stockage de log de serveur puis lancer cette commande pour suppriemr un topic
$KAFKA/bin/kafka-topics.sh --zookeeper localhost:2181 --delete --topic velib-stations

