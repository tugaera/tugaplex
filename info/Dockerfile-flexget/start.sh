
#!/bin/sh
if [ -f ~/.flexget/.config-lock ]; then
    rm ~/.flexget/.config-lock
fi
flexget web passwd flex123get
flexget $1 daemon start
