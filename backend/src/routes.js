const {Router} = require('express');

const ProductController = require('./controllers/ProductController');

const routes = Router();

routes.get('/products', ProductController.index); //Listar
routes.get('/products/:id', ProductController.show); // Listar pelo id
routes.post('/products', ProductController.store); // Cadastrar
routes.put('/products/:id', ProductController.update); // Atualizar
routes.delete('/products/:id', ProductController.destroy); // Excluir

module.exports = routes;