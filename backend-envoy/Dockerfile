FROM envoyproxy/envoy:v1.24.0
COPY envoy.yml /etc/envoy/envoy.yml

RUN chmod go+r /etc/envoy/envoy.yml
CMD ["/usr/local/bin/envoy","-c","/etc/envoy/envoy.yml"]
