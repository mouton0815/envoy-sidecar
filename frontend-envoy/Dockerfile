FROM envoyproxy/envoy:v1.24.0
COPY envoy.yml /etc/envoy/envoy.yml
COPY example-com.crt /etc/envoy/example-com.crt
COPY example-com.key /etc/envoy/example-com.key

RUN chmod go+r /etc/envoy/envoy.yml
CMD ["/usr/local/bin/envoy","-c","/etc/envoy/envoy.yml"]
