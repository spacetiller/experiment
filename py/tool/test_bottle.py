from bottle import get,run,template,route,request,post

@get('/')
def homepage():
    return '''
        <h1>Hello, Bottle!</h1>
    '''

@route('/:name')
def custompage(name):
    return '''
        Hello, %s !
    ''' % (name)

@get('/upload')
def upload_get():
    return '''
        <html>
            <head><title>小文件上传</title></head>
            <body>
                <div>
                    <form action="/upload" method="post" enctype="multipart/form-data">
                        文件名：<input type="text" name="filename"><br/>
                        文  件：<input type="file" value="file"><br/>
                        <input type="submit" value="上传" />
                    </form>
                </div>
            </body>
        </html>
    '''

@post('/upload')
def upload_post():
    filename = request.forms.get('filename')
    data = request.forms.get('file')
    #data = request.files.get('file')
    print(len(data))
    data.save('./' + filename, overwrite=True)

run(host='127.0.0.1', port=80)
