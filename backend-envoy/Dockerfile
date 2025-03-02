FROM envoyproxy/envoy:v1.24.0
COPY envoy.yml /etc/envoy/envoy.yml
COPY tls.crt /etc/envoy/tls.crt
COPY tls.key /etc/envoy/tls.key

RUN chmod go+r /etc/envoy/envoy.yml
CMD ["/usr/local/bin/envoy","-c","/etc/envoy/envoy.yml"]
