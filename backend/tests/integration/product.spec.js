const request = require('supertest');
const app = require('../../src/app');

describe('PRODUCT', () => {
    it('should be able to create a crud of PRODUCT', async () => {
        const responseCreate = await request(app).post('/products').send({ //Criando um produto
            name: "Teste",
            description: "Produto de Teste",
            price: "120",
            imgUrlColorOne: "ImgDeTeste",
            imgUrlColorTwo: "ImgDeTeste2"
        })
        const responseShow = await request(app).get(`/products/`+ responseCreate.body._id) //Listando um produto
        const responseIndex = await request(app).get('/products') //Listando todos os produtos
        const responseUpdate = await request(app).put('/products/' + responseCreate.body._id).send({ //Atualizando um produto
            name: "Teste Atualizado",
        })
        const responseDelete = await request(app).delete(`/products/`+ responseCreate.body._id)//Excluindo um produto

        expect(responseCreate.body).toHaveProperty('_id');
        expect(responseShow.body).toHaveProperty('_id');
        expect(responseIndex.body.docs).not.toHaveLength(0);
        expect(responseUpdate.body.name).toBe('Teste Atualizado');
        expect(responseDelete.status).toBe(200);
    })
});