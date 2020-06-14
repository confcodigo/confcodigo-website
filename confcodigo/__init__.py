from flask import Flask, render_template,abort,Blueprint
from jinja2 import TemplateNotFound

CCApp = Flask(__name__,static_folder='static',template_folder='templates')

##Apenas para o começo, uma forma mais elaborada de roteagem deve ser pensada

@CCApp.route('/', defaults={'queroIsto':''})
@CCApp.route('/<path:queroIsto>')
def CCroteador(queroIsto):
    try:
        if queroIsto.strip().lower() == 'index' :
            queroIsto = 'cctemplate'
        return render_template('%s.html'%(queroIsto))

    except TemplateNotFound :
        abort(404)

## Uma forma mais genérica de detectar erro deve ser pensada
@CCApp.errorhandler(404)
def CCgerirErro(erro):
    return render_template('ccerro.html'),404