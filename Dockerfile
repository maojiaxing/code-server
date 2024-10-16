FROM alpine:edge

# 安装依赖
RUN apk update && apk add --no-cache curl git zsh python3 py3-pip nodejs npm openjdk17 neovim
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s $(which zsh)

# 配置开发环境
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"
# RUN ln -s /usr/bin/python3 /usr/bin/python
# RUN ln -s /usr/bin/pip3 /usr/bin/pip


# 下载并安装 VS Code CLI
ARG VSCODE_CLI_VERSION
ARG VSCODE_CLI_PLATFORM
RUN echo "Building for platform: ${VSCODE_CLI_PLATFORM}, version: ${VSCODE_CLI_VERSION}"
RUN curl -sL "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-${VSCODE_CLI_PLATFORM}" -o /tmp/vscode-cli.tar.gz && \
    tar -xzf /tmp/vscode-cli.tar.gz -C /usr/local/bin && \
    rm /tmp/vscode-cli.tar.gz

# 设置工作目录
WORKDIR /workspace

ENTRYPOINT ["code"]

CMD ["serve-web"]


