#!/bin/bash

cat > index.html<<EOF
<h1>Hello, World </h1>
<p>db_address : ${db_address}</p>
<p>db port : ${db_port}</p>
EOF

nohup busybox httpd -f -p ${server_port} &

