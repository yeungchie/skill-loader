# skill-loader

优化 load 函数，使其能够识别相对路径。

对以前写的一篇博客中的例程进行一些兼容性优化和功能加强：[load 函数优化，识别相对路径 - YEUNGCHIE - 博客园](https://www.cnblogs.com/yeungchie/p/15999427.html)

## 下载代码

+ GitHub

```shell
git clone --depth 1 https://github.com/yeungchie/skill-loader.git
```

+ Gitee

```shell
git clone --depth 1 https://gitee.com/yeungchie/skill-loader.git
```

## 加载配置

在 `~/.cdsinit` 中添加：

```lisp
load("<path to skill-loader>/load.il")
```

## 使用方法

### ycLoad

可正确识别以文件本身路径为参考的相对路径。

```lisp
ycLoad("./script.il")
; END
```

### ycLoadi

与 `ycLoad` 相同，不同之处在于 `ycLoadi` 忽略加载过程中遇到的错误，只打印错误信息，然后继续加载。

```lisp
ycLoadi("./script.il")
; END
```

> 用法与 `load` 和 `loadi` 一致。

## 函数拓展

假设如下场景：

1. 有一个脚本文件路径为 `/home/yeungchie/skill/script.il`。
2. 在 `/home/yuengchie/project/` 下启动 virtuoso 工具。
3. 使用 `load("../skill/script.il")` 语句来加载这个脚本文件。
4. 下面的演示中，代码框示例 `script.il` 中的内容，用 `=>` 来代表加载脚本后在 CIW 窗口中打印的内容。

### ycGetFileName

+ 获取当前文件的路径。

    ```lisp
    fileName = ycGetFileName()
    println(fileName)
    ; END
    ```

    > => "/home/yeungchie/skill/script.il"

### ycGetBaseName

+ 获取文件名。

    ```lisp
    baseName = ycGetBaseName(fileName)
    println(baseName)
    ; END
    ```

    > => "script.il"

### ycGetDirName

+ 获取文件父目录名。

    ```lisp
    dirName = ycGetDirName(fileName)
    println(dirName)
    ; END
    ```

    >  => "/home/yeungchie/skill/"

### ycRealPath

+ 读取相对路径，返回绝对路径。

    ```lisp
    filePath = ycRealPath("../skill/script.il")
    println(filePath)
    ; END
    ```

    > => "/home/yeungchie/skill/script.il"

## 注意事项

上述的函数调用注意不能位于当前文本的最后一行 `; END`，否则可能会出现路径获取错误的问题。
原因不详，猜测是 Skill 的 bug。

> 这个现象是我的脚本文件路径位于 NFS 挂载的远程存储的时候发现的，复现率极高。

```lisp
ycLoad("xxx")
; 特意空一行
```
