FROM alpine:3.8

ENV OPERATOR=/usr/local/bin/openexchange-kube-operator \
    USER_UID=1001 \
    USER_NAME=openexchange-kube-operator

# install operator binary
COPY build/_output/bin/openexchange-kube-operator ${OPERATOR}

COPY build/bin /usr/local/bin
RUN sed -i 's/\r$//' /usr/local/bin/user_setup  && chmod +x /usr/local/bin/user_setup
RUN sed -i 's/\r$//' /usr/local/bin/entrypoint  && chmod +x /usr/local/bin/entrypoint
RUN  /usr/local/bin/user_setup

ENTRYPOINT ["/usr/local/bin/entrypoint"]

USER ${USER_UID}