FROM gitpod/workspace-full

## Install dependencies
RUN sudo apt update && \
    sudo apt install -y curl httpie jq dos2unix

RUN sudo gpg -k && \
    sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69 && \
    echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list && \
    sudo apt-get update && \
    sudo apt-get install k6


USER gitpod

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    sdk install java 21.0.3-tem && \
    sdk default java 21.0.3-tem"
