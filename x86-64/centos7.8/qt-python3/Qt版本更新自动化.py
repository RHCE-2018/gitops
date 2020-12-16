import NetworkQtVersion
import LocalQtVersion
import QtDownload

def main():
    netqtinfos = NetworkQtVersion.getnetworkversion()
    localqtinfos = LocalQtVersion.getLocalVersion()
    for i in range(0,3):
        #网络版本
        netver = netqtinfos[i]
        #本地版本
        for localqtinfo in localqtinfos[i]:
            print(netver)
            if type(localqtinfo) == type("loca"):
                print("版本不存在，开始下载")
                #QtDownload.download_last_version()
            else:
                #print(localqtinfo[1])
                if netver != localqtinfo[1]:
                    print("版本不同，开始下载")
                else:
                    print("版本相同，继续执行")

if __name__ == "__main__":
    # execute only if run as a script
    main()