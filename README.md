# skill-loader

优化 load 函数，使其能够识别相对路径。

[load 函数优化，识别相对路径 - YEUNGCHIE - 博客园](https://www.cnblogs.com/yeungchie/p/15999427.html)

## 下载代码

+ GitHub

```bash
git clone https://github.com/yeungchie/skill-loader.git
```

+ Gitee

```bash
git clone https://gitee.com/yeungchie/skill-loader.git
```

## 加载配置

在 `~/.cdsinit` 中添加：

```skill
load("<path_to_skill_loader>/load.il")
```

## 使用方法

### ycLoad

可正确识别以文件本身路径为参考的相对路径。

```skill
ycLoad("./script.il")
; END
```

### ycLoadi

与 `ycLoad` 相同，不同之处在于 `ycLoadi` 忽略加载过程中遇到的错误，只打印错误信息，然后继续加载。

```skill
ycLoadi("./script.il")
; END
```

> 用法与 `load` 和 `loadi` 一致。

## 函数拓展

> 1、下面假设有一个脚本文件在 `/home/yeungchie/skill/script.il` 路径下。</br>
> 2、在 `/home/yuengchie/project/` 下启动 virtuoso 工具。</br>
> 3、使用 `load("../skill/script.il")` 来加载这个脚本文件。</br>
> 4、以下代码框示例 `script.il` 中的内容。</br>
> 5、用 `=>` 代表加载脚本后在 CIW 中打印的内容。</br>

### ycGetFileName

+ 获取当前文件的路径。

    ```skill
    fileName = ycGetFileName()
    println(fileName)
    ; END
    ```

    > => "/home/yeungchie/skill/script.il"

### ycGetBaseName

+ 获取文件名。

    ```skill
    baseName = ycGetBaseName(fileName)
    println(baseName)
    ; END
    ```

    > => "script.il"

### ycGetDirName

+ 获取文件父目录名。

    ```skill
    dirName = ycGetDirName(fileName)
    println(dirName)
    ; END
    ```

    >  => "/home/yeungchie/skill/"

### ycReadRelPath

+ 读取相对路径，返回绝对路径。

    ```skill
    filePath = ycReadRelPath("../skill/script.il")
    println(filePath)
    ; END
    ```

    > => "/home/yeungchie/skill/script.il"

### 注意事项

上述的函数调用注意不能位于当前文本的最后一行 `; END`，否则可能会出现路径获取错误的问题，原因不详，猜测是 Skill 的 bug。
