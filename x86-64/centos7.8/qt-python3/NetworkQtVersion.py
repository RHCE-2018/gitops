#网络Qt版本获取
def getnetworkversion():
    networkversioninfo = []
    import requests
    from bs4 import BeautifulSoup
    headers = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36 Edg/85.0.564.51'}
    url = ''
    #5.9版本对比
    url = "http://download.qt.io/official_releases/qt/5.9/"
    response = requests.get(url=url, headers=headers)
    response.encoding = 'utf-8'
    strhtml = response.text
    soup=BeautifulSoup(strhtml,'lxml')
    #当前5.9最新版本
    networkversioninfo.append(soup.find_all('a')[4].string.strip('"/'))

    #5.12版本对比
    url = "http://download.qt.io/official_releases/qt/5.12/"
    response = requests.get(url=url, headers=headers)
    response.encoding = 'utf-8'
    strhtml = response.text
    soup=BeautifulSoup(strhtml,'lxml')
    #当前5.12最新版本
    networkversioninfo.append(soup.find_all('a')[4].string.strip('"/'))

    #5.15版本对比
    url = "http://download.qt.io/official_releases/qt/5.15/"
    response = requests.get(url=url, headers=headers)
    response.encoding = 'utf-8'
    strhtml = response.text
    soup=BeautifulSoup(strhtml,'lxml')
    #当前5.15最新版本
    networkversioninfo.append(soup.find_all('a')[4].string.strip('"/'))

    return networkversioninfo

if __name__ == "__main__":
    # execute only if run as a script
    networkversions = getnetworkversion()
    for networkversion in networkversions:
        print(networkversion)