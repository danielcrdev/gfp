from flask_swagger_ui import get_swaggerui_blueprint

swagger_url = '/api'
api_url = '/static/swagger.json'
swaggerui_blueprint = get_swaggerui_blueprint(swagger_url,api_url,
    config={'app_name': "GFP | Movimento Financeiro"})

def get_blueprint():
    return swaggerui_blueprint