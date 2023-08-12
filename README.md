### CPU

```
curl -sL yabs.sh | bash -s -- -fi -5
```

### 硬盘

```
curl -sL yabs.sh | bash -s -- -ig
```

### 回程路由

**BestTrace**

```
curl -sLo besttrace https://github.com/chika0801/tool/raw/main/besttrace && chmod +x besttrace
```

```
./besttrace IP
```

```
./besttrace --tcp IP
```

**NextTrace**

```
curl -sLo nexttrace https://github.com/sjlleo/nexttrace/releases/latest/download/nexttrace_linux_amd64 && chmod +x nexttrace
```

```
./nexttrace --tcp IP
```

```
./nexttrace --udp IP
```

**MTR**

```
apt install -y mtr-tiny
```

```
mtr --tcp --psize 1400 IP
```

```
mtr --udp --psize 1400 IP
```

### 流媒体解锁

```
bash <(curl -L -s check.unlock.media)
```

或

```
curl -sLo nf https://github.com/sjlleo/netflix-verify/releases/download/v3.1.0-1/nf_linux_amd64 && chmod +x nf
```

```
./nf
```

### 测速

```
curl -sL https://raw.githubusercontent.com/chika0801/tool/main/speedtest.sh | bash
```

或

```
curl -sLo sp https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz && tar -xzf sp && rm -r sp speedtest.5 speedtest.md && chown root:root speedtest
```

```
./speedtest --accept-license
```
