DNS请求过程简述

简单的说，代理环境（方式）分为HTTP/SOCKS5代理（如在电脑上用v2rayN）和透明代理（如在手机上用v2rayNG）两种。

1. 以HTTP/SOCKS5代理为例，代理环境如下
 - Chrome，使用SwitchyOmega插件，设置一个HTTP代理，代理服务器填写127.0.0.1，端口填写10809（v2rayN）
 - v2rayN，默认监听10809的HTTP端口，使用如下配置
