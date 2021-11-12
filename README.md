BBFTP-Server
====================

An bbFTP implementation for Docker.


BUILD
========

BBFTP Server:

```
docker build . -t rickkbarbosa/bbftp-server
```


bbFTP Client:

```
docker build --file Dockerfile.client . -t rickkbarbosa/bbftp-client
```

Usage:
/usr/bin/install -c bbftp /usr/local/bin/bbftp
/usr/bin/install -c bbftpstatus /usr/local/bin/bbftpstatus

Parameters: 

``` 
Usage bbftp -i inputfile | -e "command line" 
            -u username
           [-b (background)]
           [-c (gzip compress)]
           [-D[min:max] (Domain of Ephemeral Ports) ]
           [-f errorfile]
           [-E server command for ssh]
           [-I ssh identity file]
           [-L ssh command]
           [-s (use ssh)]
           [-S (use ssh in batch mode)]
           [-m (special output for statistics)]
           [-n (simulation mode: no data written)]
           [-o outputfile]
           [-p number of // streams]
           [-q (for QBSS on)]
           [-r number of tries ]
           [-R .bbftprc filename]
           [-t (timestamp)]
           [-V (verbose)]
           [-w controlport]
           [-W (print warning to stderr) ]
           host
      or 
      bbftp -v
```


More information about bbFTP on [NASA Site](https://www.nas.nasa.gov/hecc/support/kb/using-bbftp-for-remote-file-transfers_147.html)