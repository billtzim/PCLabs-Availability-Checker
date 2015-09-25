#!/bin/bash

xmlpath="/var/www/httpdocs/mobile/pclabs.xml"
query="SELECT CONCAT_WS(',',labFullName,labCapacity,COUNT(pcStatus)) as Result FROM pclabs_status INNER JOIN pclabs_labs ON pclabs_labs.labOUName = pclabs_status.pcLabOUName WHERE pcStatus='free' GROUP BY pcLabOUName"

echo "<?xml version=\"1.0\"?><root>" > $xmlpath

while IFS="," read -a qres
do
        echo "<lab description=\""${qres[0]}"\"><total count=\""${qres[1]}"\"/><free count=\""${qres[2]}"\"></free></lab>" >> $xmlpath
done < <(mysql -s -N -upclabs_xml -p`cat /noc/scripts/nst/mobile_nisides_plirotita_dbpass` -h db.ccf.auth.gr -D pclabs_freepcs -e "${query}" 2>/dev/null)

echo "</root>" >> $xmlpath

chown root:mobileapp $xmlpath
