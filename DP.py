# encoding: utf-8
import urllib
import urllib2
import re
import os
import time

def getListWithMesage(content):
    content = content.decode('utf-8')
    


    pattern = re.compile('<head>.+?<title>(.*?)</title>',re.S)
    items = re.findall(pattern,content)
    print("sss")
    showStrTitle = items[0];
    showStrTitle = showStrTitle.split('-')[0];
    showStrTitle = showStrTitle.encode('utf-8')
    print(showStrTitle)
    


    pattern = re.compile('<div class="chaptercontent">(.*?)</div>',re.S)
    items = re.findall(pattern,content)
    print("sss")
    showStr = items[0].encode('utf-8')
    showStr = showStr.replace('<p>','\n')
    showStr = showStr.replace('</p>','')



    path = '/Users/shan/Desktop/pythonP/DPLIST/list.txt'
    fp = open(path,'a')
    fp.write(showStrTitle + '\n')
    fp.close()   

    path = '/Users/shan/Desktop/pythonP/DP/'+showStrTitle+'.txt'
    fp = open(path,'a')
    fp.write(showStr + '\n')
    fp.close()    


def getcontentWithUrl(url):
    user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36'
    headers = { 'User-Agent' : user_agent,
    }
    try:
        request = urllib2.Request(url,headers = headers)
        response = urllib2.urlopen(request)
        return response.read()
    except urllib2.URLError,e:
    	if hasattr(e,"code"):
        	print e.code
    	if hasattr(e,"reason"):
        	print e.reason
	

for page in xrange(1400,1500):
    url = 'http://m.doupocangqiong1.com/1/t9'+ str(page)+ '.html' 
    print url
    content =  getcontentWithUrl(url)
    getListWithMesage(content)
    # time.sleep(0.5)


