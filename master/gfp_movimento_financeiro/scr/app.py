from flask import Flask
import swagger, routes, erros

nome_app   = "gfp_movimento_financeiro"
versao_app = "v100"

def create_app():
    app = Flask(nome_app + "_" + versao_app)
    #app.register_blueprint(swagger.get_blueprint())
    app.register_blueprint(routes.get_blueprint())
    return app

if __name__ == '__main__':
    a = create_app()
    a.run(port=5002)