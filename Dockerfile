# Docker Hubから軽量なalpineベースイメージを使用
FROM alpine:latest

# コンテナ起動時に簡単なメッセージを出力するコマンドを設定
CMD ["echo", "Hello, GitHub Container Registry!"]
