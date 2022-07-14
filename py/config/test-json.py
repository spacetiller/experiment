import json
import json5
import re

# 读取带注释 // /* */ 的json文件
def parse_json(filename):
    """ Parse a JSON file
        First remove comments and then use the json module package
        Comments look like :
            // ...
        or
            /*
            ...
            */
    """
    res = []
    f = open(filename)
    all_lines = f.readlines()
    #去除形如 // 但不包括 http:// ip_addr 的注释
    for line in all_lines:
        l = strip_comment(line)
        res.append(l)
    result = []
    comment = False
    #去除形如 /* */的注释
    for l in res:
        if l.find("/*") != -1:
            comment = True
        if not comment:
            result.append(l)
        if l.find("*/") != -1:
            comment = False
    #若直接使用 json.loads(str(res)) 会报 "ValueError: No JSON object could be decoded"
    str_res = ""
    for i in result:
        str_res += i
    return json.loads(str_res)

def strip_comment(line):
    #匹配IP地址的正则表达式
    ip_re = re.compile('[0-9]+(?:\.[0-9]+){0,3}')
    index = line.find("//")
    if index == -1 :
        return line
    line_str = line[index + 2:]
    if ip_re.search(line_str):
        return line[:index+16] + strip_comment(line[index+17:])
    else:
        return line[:index] + strip_comment(line_str)


comment_re = re.compile(
    '(^)?[^\S\n]*/(?:\*(.*?)\*/[^\S\n]*|/[^\n]*)($)?',
    re.DOTALL | re.MULTILINE
)

def parse_json2(filename):
    """ Parse a JSON file
        First remove comments and then use the json module package
        Comments look like :
            // ...
        or
            /*
            ...
            */
    """
    with open(filename) as f:
        content = ''.join(f.readlines())
        ## Looking for comments
        match = comment_re.search(content)
        while match:
            # single line comment
            content = content[:match.start()] + content[match.end():]
            match = comment_re.search(content)

        print
        content
        # Return json file
        return json.loads(content)


CAUTION_PRINT_HEAD = 'caution: '

# 创建一个xstr类，用于处理从文件中读出的字符串
class xstr:
    def __init__(self, instr):
        self.instr = instr

    # 删除“//”标志后的注释
    def rmCmt(self):
        qtCnt = cmtPos = slashPos = 0
        rearLine = self.instr
        # rearline: 前一个“//”之后的字符串，
        # 双引号里的“//”不是注释标志，所以遇到这种情况，仍需继续查找后续的“//”
        while rearLine.find('//') >= 0: # 查找“//”
            slashPos = rearLine.find('//')
            cmtPos += slashPos
            # print 'slashPos: ' + str(slashPos)
            headLine = rearLine[:slashPos]
            while headLine.find('"') >= 0: # 查找“//”前的双引号
                qtPos = headLine.find('"')
                if not self.isEscapeOpr(headLine[:qtPos]): # 如果双引号没有被转义
                    qtCnt += 1 # 双引号的数量加1
                headLine = headLine[qtPos+1:]
                # print qtCnt
            if qtCnt % 2 == 0: # 如果双引号的数量为偶数，则说明“//”是注释标志
                # print self.instr[:cmtPos]
                return self.instr[:cmtPos]
            rearLine = rearLine[slashPos+2:]
            # print rearLine
            cmtPos += 2
        # print self.instr
        return self.instr

    # 判断是否为转义字符
    def isEscapeOpr(self, instr):
        if len(instr) <= 0:
            return False
        cnt = 0
        while instr[-1] == '\\':
            cnt += 1
            instr = instr[:-1]
        if cnt % 2 == 1:
            return True
        else:
            return False


# 从json文件的路径JsonPath读取该文件，返回json对象
def loadJson(JsonPath):
    try:
        srcJson = open(JsonPath, 'r')
    except:
        print(CAUTION_PRINT_HEAD + 'cannot open ' + JsonPath)
        quit()

    dstJsonStr = ''
    for line in srcJson.readlines():
        if not re.match(r'\s*//', line) and not re.match(r'\s*\n', line):
            xline = xstr(line)
            dstJsonStr += xline.rmCmt()

    # print dstJsonStr
    dstJson = {}
    try:
        dstJson = json.loads(dstJsonStr)
        return dstJson
    except:
        print(CAUTION_PRINT_HEAD + JsonPath + ' is not a valid json file')
        quit()


if __name__ == '__main__':
    # jsn = parse_json2('test.json')    # not support url like http://192.168.0.1
    # print(jsn)
    # jsn = parse_json('test.json')
    # print(jsn)
    # jsn = loadJson('test.json')
    # print(jsn)
    print('-------')
    with open('test.json', encoding='utf-8') as f:
        fstr = f.read().strip()
        # print(json.loads(fstr))
        print(json5.loads(fstr))
