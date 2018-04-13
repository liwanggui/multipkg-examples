# NGINX 示例

**nginx 工程目录结构**

```
nginx/
├── index.yaml
├── nginx-1.3.10.tar.gz
├── root
│   └── usr
│       └── local
│           └── nginx
│               ├── conf
│               │   ├── enable-ssl-vhost-example.conf
│               │   ├── enable-php.conf
│               │   ├── nginx.conf
│               │   ├── pathinfo.conf
│               │   ├── proxy.conf
│               │   └── vhost
│               └── support-file
│                   └── nginx
└── scripts
    ├── build
    ├── post.sh
    └── postun.sh
```

**目录解释**

- root: `root` 目录中的文件直接提供了 `rpm` 文件列表和安装路径，目录内的文件会自动加入到生成的 `rpm` 包中.
- scripts: `multipkg` 生成 `rpm` 包过程中需要使用的脚本及 rpm 安装前后，卸载前后使用的脚本
  - build: 源码编译安装相关命令
  - pre.sh: `rpm` 包安装前
  - post.sh: `rpm` 包安装后
  - preun.sh: `rpm` 包卸载前
  - postun.sh: `rpm` 包卸载后

**生成 `rpm` 包**

在工程目录执行以下命令生成 `rpm` 包

```
[root@localhost nginx]# multipkg .
nginx-1.3.10-el6.x86_64.rpm
```
