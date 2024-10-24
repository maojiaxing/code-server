FROM alpine:edge

# 安装依赖
RUN apk update && apk add --no-cache curl git zsh python3 py3-pip nodejs npm openjdk17 neovim
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 配置开发环境
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"


# 下载并安装 VS Code CLI
ARG VSCODE_CLI_VERSION
ARG VSCODE_CLI_PLATFORM
RUN echo "Building for platform: ${VSCODE_CLI_PLATFORM}, version: ${VSCODE_CLI_VERSION}"
RUN curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-${VSCODE_CLI_PLATFORM}" -o /tmp/vscode-cli.tar.gz && \
    tar -xzf /tmp/vscode-cli.tar.gz -C /usr/bin && \
    rm /tmp/vscode-cli.tar.gz

    
COPY ./etc/passwd /etc/passwd
RUN ./script/setup

# 设置工作目录
WORKDIR /workspace

ENTRYPOINT ["code"]

EXPOSE 8000

CMD ["serve-web"]


