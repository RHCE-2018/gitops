# 通过链接下载文件
def download(file_name, link,download_location = ""):
    import urllib.request
    import re
    import os
    u = urllib.request.urlopen(link)
    f = open(download_location + file_name, 'wb')
    block_sz = 8192
    while True:
        buffer = u.read(block_sz)
        if not buffer:
            break
        f.write(buffer)
    f.close()
    print("Sucessful to download" + " " + file_name)

# 网络Qt版本获取
def download_last_version(minor_version,download_location = ""):
    major_version = minor_version.split(".")[0] + "." + minor_version.split(".")[1]
    import requests
    import re
    from bs4 import BeautifulSoup
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36 Edg/85.0.564.51'}

    # 安装包的下载
    url = "http://download.qt.io/official_releases/qt/" + major_version + "/" + minor_version + "/"
    response = requests.get(url=url, headers=headers)
    response.encoding = 'utf-8'
    strhtml = response.text
    match = re.compile(r'(?<=href=["]).*?(?=["])')
    download_link = re.findall(match, strhtml)
    install_windows_download_link = url + download_link[10]
    print(install_windows_download_link)
    # download(download_link[8],src_zip_download_link,download_location)#下载zip
    install_linux_download_link = url + download_link[14]
    print(install_linux_download_link)
    # download(download_link[10],src_tar_download_link,download_location)#下载tar

    # src压缩包的下载
    url = "http://download.qt.io/official_releases/qt/" + major_version + "/" + minor_version + "/single/"
    response = requests.get(url=url, headers=headers)
    response.encoding = 'utf-8'
    strhtml = response.text
    match = re.compile(r'(?<=href=["]).*?(?=["])')
    download_link = re.findall(match, strhtml)
    src_zip_download_link = url + download_link[8]
    print(src_zip_download_link)
    # download(download_link[8],src_zip_download_link,download_location)#下载zip
    src_tar_download_link = url + download_link[10]
    print(src_tar_download_link)
    # download(download_link[10],src_tar_download_link,download_location)#下载tar

if __name__ == "__main__":
    # execute only if run as a script
    download_last_version("5.12.9")
