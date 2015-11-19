;
; BIND data file for redesfga.com
;
$TTL    3h
@       IN      SOA     ns1.redesfga.com. admin.redesfga.com. (
                          1        ; Serial
                          3h       ; Refresh after 3 hours
                          1h       ; Retry after 1 hour
                          1w       ; Expire after 1 week
                          1h )     ; Negative caching TTL of 1 day
;
@       IN      NS      ns1.redesfga.com.
@       IN      NS      ns2.redesfga.com.


redesfga.com.    IN      MX      10      mail.redesfga.com.
redesfga.com.    IN      A       192.168.1.22
ns1                     IN      A       192.168.1.22
ns2                     IN      A       192.168.1.22
www                     IN      CNAME   redesfga.com.
mail                    IN      A       192.168.1.22
ftp                     IN      CNAME   redesfga.com.
