## Install

```git clone https://github.com/corezoid/graphinstaller.git```

```cd graphinstaller```


Create namespace if need:
```kubectl create namespace graphinstaller```

Make changes in `values.yaml` file and run command:
```helm upgrade -i graphinstaller -n graphinstaller -f ./values.yaml .```