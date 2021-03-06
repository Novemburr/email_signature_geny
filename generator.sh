#!/bin/sh

gen_sing () {
        url=`echo $6 | sed 's/https\?:\/\///'`;
        url=`echo $url | sed 's/\/$//'`;
        gaddress=`echo $address | sed 's/\ /+/g'`;
	address=`echo $address | sed -e 's/\b\(.\)/\u\1/g'`;

        echo "
        <table>
        <tr>
        <td>
        <img style=\"margin:0px;padding:0px;\" src=\"$5\" height=\"70\">
        </td>
        <td style=\"margin-left:10px;\">
        <pre style=\"color:#444;font-family: Arial, Helvetica, sans-serif;margin:0px;padding:0px;\">$1, $3, $2</pre>
        <pre style=\"color:#444;font-family: Arial, Helvetica, sans-serif;margin:0px;padding:0px;\">$7</pre>
        <a style=\"color:#0096E1;text-decoration:none;margin:0px;padding:0px;\" href=\"tel:$4\">$4</a><br>
        <a style=\"color:#0096E1;text-decoration:none;margin:0px;padding:0px;\" href=\"$6\">$url</a><br>
        <a style=\"color:#0096E1;text-decoration:none;margin:0px;padding:0px;\" href=\"https://www.google.com/maps/place/$gaddress\">$address</a>
        </td>
        </tr>
        </table>
        " > $1.html
}

if [ $# -gt 1 ] 
then

	fname=$1
	lname=$2
	mi=$3
	phone=$4
	logo=$5
	web_link=$6
	title=$7
	address=$8


	gen_sing $fname $lname $mi $phone $logo $web_link $title $address;

else

	while IFS=, read fname lname mi	phone logo web_link title address
	do
		gen_sing "$fname" "$lname" "$mi" "$phone" "$logo" "$web_link" "$title" "$address";

	done < ./$1

fi
