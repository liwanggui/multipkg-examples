# saferm 示例


saferm 是不需要编译就可以运行的脚本工具，我们只需要在 root 目录下调整好目录结构即可，在 index.yaml 配置文件填写一些必要的参数就可以开始打 rpm 包.


**saferm 目录结构**

```
saferm/
├── index.yaml
└── root
    └── usr
        └── local
            └── bin
                ├── saferm.sh
                └── clean_trash.sh
```
