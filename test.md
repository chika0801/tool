DNS请求过程简述

常见的代理环境（方式）分为HTTP/SOCKS5代理（如在电脑上用v2rayN）和透明代理（如在手机上用v2rayNG）。

1. HTTP/SOCKS5代理
 - Chrome，使用SwitchyOmega插件，设置一个HTTP代理，代理服务器填写127.0.0.1，端口填写10809
 - v2rayN，监听10809的HTTP端口，作为客户端，使用如下配置

```
{
    "log": {
        "loglevel": "warning"
    },
    "dns": {
        "servers": [
            "223.5.5.5",
            "119.29.29.29"
        ],
        "queryStrategy": "UseIPv4"
    },
    "routing": {
        "domainStrategy": "IPIfNonMatch",
        "rules": [
            {
                "type": "field",
                "domain": [
                    "geosite:category-ads-all"
                ],
                "outboundTag": "block"
            },
            {
                "type": "field",
                "domain": [
                    "geosite:cn"
                ],
                "outboundTag": "direct"
            },
            {
                "type": "field",
                "ip": [
                    "geoip:cn"
                ],
                "outboundTag": "direct"
            }
        ]
    },
    "inbounds": [
        {
            "listen": "127.0.0.1",
            "port": 10808,
            "protocol": "socks",
            "settings": {
                "udp": true
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        },
        {
            "listen": "127.0.0.1",
            "port": 10809,
            "protocol": "http",
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "vless",
            此处省略节点配置
            "tag": "proxy"
        },
        {
            "protocol": "freedom",
            "settings": {
                "domainStrategy": "UseIPv4"
            },
            "tag": "direct"
        },
        {
            "protocol": "blackhole",
            "settings": {
                "response": {
                    "type": "http"
                }
            },
            "tag": "block"
        }
    ]
}
```

常见问题：

1. 若在配置里不写 "dns" 部分，会默认使用系统的DNS。上面的配置里使用的DNS是223.5.5.5和119.29.29.29。"queryStrategy": "UseIPv4" 表示只请求IPv4的结果。
2. "routing" 部分里的 "domainStrategy": "IPIfNonMatch" 表示域名按照从上到下的顺序匹配域名规则，若未命中任何规则，则使用"dns" 部分的DNS进行DNS请求，若有多个DNS，通常也是按照从上到下的顺序进行。
3. 
