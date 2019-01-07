# multipkg 制作 rpm 包示例


## multipkg 的工作原理

`multipkg` 并没有按照 rpm 的格式去写一个 rpm 文件，因为那样做确实太复杂了，像其他工具一样，`multipkg` 在制作rpm格式的软件包时，是基于 `rpmbuild` 命令来实现的。也就是说，准备好源码，`spec` 文件，然后放到合适的目录中，调用 `rpmbuild` 命令，就编译生成了rpm文件。只不过 `multipkg` 把 `rpmbuild` + `spec` 文件这种做包方式用的更优雅些，因为你不需要去关注 `spec` 文件，也不需要去关注编译 rpm 文件的目录，而只需要关注你的源码和编译时 hook 脚本即可。

`multipkg` 工作的大致原理是：通过 `index.yaml` 文件来提供 SPEC 文件中的所有 tag, 比如 `name`, `version`, `require`, `config` 等信息，然后通过 `scripts/` 目录下的 `post.sh`, `pre.sh`, `postun.sh`, `preun.sh` 这四个脚本，来存储  `rpmbuild`  时在安装前后，卸载前后执行的脚本内容。最后，`root` 目录提供了 rpm 的文件列表的一部分（因为 scripts 的脚本中可能会动态创建文件）。

`source` 或者源码压缩包提供了源码。这时，构建 rpm 的因素就足够了。 spec 文件由 `index.yaml` 文件和 scripts 构成。 对于需要编译类的工程，源码压缩包或者 source 目录中的文件提供了源码。

对于不需要编译类的工程，root 中的文件直接提供了 rpm 的文件列表和安装路径。这样，在编译时，先通过 `index.yaml` 和 scripts 中的文件替换 spec 文件模板，生成该工程用的 spec 文件，然后调整源码和 spec 文件的目录，调用  `rpmbuild` 命令，作用于源码和 spec 文件，就形成了 rpm 包。


## 安装 multipkg

- [Github](https://github.com/ytoolshed/multipkg.git)
- [参考资料](https://yq.aliyun.com/articles/68346)

```
git clone https://github.com/ytoolshed/multipkg.git

cd multipkg

yum install -y perl-YAML-Syck perl-ExtUtils-MakeMaker rpm-build

PREFIX=./root PKGVERID=0 INSTALLDIR=source scripts/transform
perl -I ./source/lib root/usr/bin/multipkg -t .

sudo yum -y install multipkg-*rpm

rm multipkg*rpm

git-multipkg -b https://github.com/ytoolshed/ multipkg

sudo yum upgrade ./multipkg*rpm
```


