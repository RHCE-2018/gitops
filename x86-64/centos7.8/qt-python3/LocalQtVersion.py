#本地版本获取
def getLocalVersion():
    localversioninfo = []
    import os
    import sys
    import string
    path = "D:\\QTinstall\\install"  # 路径选择
    versions = ["5.9","5.12","5.15"]
    for version in versions:
        dirs = os.listdir(path + "\\" + version)  # 使用函数到指定路径
        tempversioninfo = []
        if not len(dirs) :
            tempversioninfo.append("文件不存在")
        for file in dirs:
            #qtinstall = os.path.splitext(file)[0]+os.path.splitext(file)[1]
            qtinstall = os.path.splitext(file)[0]
            qtinstallinfo = qtinstall.split('-')
            tempversioninfo.append([qtinstallinfo[2],qtinstallinfo[4]])
        localversioninfo.append(tempversioninfo)
    return localversioninfo

if __name__ == "__main__":
    # execute only if run as a script
    localversions = getLocalVersion()
    for localversion in localversions:
        print(localversion)