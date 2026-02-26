# 引用 GitHub Actions 自动构建的基础镜像
# 请将 <your-github-username> 替换为你的 GitHub 用户名
# 请将 <repo-name> 替换为你的仓库名
FROM ghcr.io/<your-github-username>/<repo-name>/jdk17-base:latest

WORKDIR /app

ADD target/xingyang-jingwu-business-1.0.0.jar /app/app.jar

ENTRYPOINT ["sh","-c","exec java $JAVA_OPTS --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED -Djava.security.egd=file:/dev/./urandom -jar /app/app.jar"]

VOLUME /app/logs
