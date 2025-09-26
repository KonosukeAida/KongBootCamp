# ベースイメージはdocker runコマンドで使用されているものをそのまま指定
FROM kong/kong-gateway:3.10

# ----------------------------------------------------------------------
# 環境変数 (Environment Variables) の設定
# 機密情報 (KONG_CLUSTER_CERT, KONG_CLUSTER_CERT_KEY) は削除済み
# ----------------------------------------------------------------------

# Kongの基本的な設定
ENV KONG_ROLE="data_plane" \
    KONG_DATABASE="off" \
    KONG_VITALS="off" \
    KONG_KONNECT_MODE="on"

# クラスター接続およびmTLS設定 (接続先情報自体は機密情報ではないため残す)
ENV KONG_CLUSTER_MTLS="pki" \
    KONG_CLUSTER_CONTROL_PLANE="72ede01046.au.cp.konghq.com:443" \
    KONG_CLUSTER_SERVER_NAME="72ede01046.au.cp.konghq.com" \
    KONG_LUA_SSL_TRUSTED_CERTIFICATE="system"

# テレメトリー接続設定
ENV KONG_CLUSTER_TELEMETRY_ENDPOINT="72ede01046.au.tp.konghq.com:443" \
    KONG_CLUSTER_TELEMETRY_SERVER_NAME="72ede01046.au.tp.konghq.com"

# ポートの宣言
EXPOSE 8000
EXPOSE 8443