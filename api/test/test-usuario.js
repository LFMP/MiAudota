"use strict";

// Desenvolvedor: Luiz Fellipe Machi Pereira

const request = require("request");
const rp = require("request-promise-native");
const expect = require("chai").expect;

const baseUrl = "http://localhost:8000/api";

const postTest = {
  nome: "nomezinho",
  realm: "Normal",
  username: "teste",
  email: "teste@teste.com",
  password: "123",
  emailVerified: false
};

const emailInvalidoTest = {
  nome: "nomezinho",
  realm: "Normal",
  username: "teste",
  email: "naoeumemail",
  password: "123"
};

const updateTest = {
  nome: "Nome do fulano",
  realm: "Normal",
  username: "teste",
  email: "teste@teste.com",
  password: "senhaforte",
  emailVerified: true
};

const roleTest = {
  nome: "Nome do fulano",
  realm: "inexistente",
  username: "teste",
  email: "teste@teste.com",
  password: "senhaforte",
  emailVerified: true
};

describe("Modelo Usuário", () => {
  describe("Testes CRUD", () => {
    it("Deveria criar um novo usuário e retornar status 200", done => {
      request.post(
        {
          headers: { "content-type": "application/json" },
          url: `${baseUrl}/Usuarios`,
          body: JSON.stringify(postTest)
        },
        (error, response, body) => {
          const obj = JSON.parse(response.body);
          postTest["id"] = obj.id;
          expect(response.statusCode).to.equal(200);
          expect(obj.nome).to.equal("nomezinho");
          expect(obj.realm).to.equal("Normal");
          expect(obj.username).to.equal("teste");
          expect(obj.email).to.equal("teste@teste.com");
          expect(obj.emailVerified).to.equal(false);
          done();
        }
      );
    });

    it("Deveria retornar status 200 e atualizar atributos ao atualizar um Usuário", done => {
      request.post(
        {
          headers: {
            "content-type": "application/json"
          },
          url: `${baseUrl}/Usuarios/login`,
          body: JSON.stringify({
            username: postTest.username,
            password: postTest.password
          })
        },
        (error, response, body) => {
          const obj = JSON.parse(response.body);
          request.patch(
            {
              headers: {
                "content-type": "application/json",
                Accept: "application/json"
              },
              url: `${baseUrl}/Usuarios/${obj.userId}?access_token=${obj.id}`,
              body: JSON.stringify(updateTest)
            },
            (error, responsePatch, body) => {
              const obj = JSON.parse(responsePatch.body);
              expect(responsePatch.statusCode).to.equal(200);
              expect(obj.nome).to.equal("Nome do fulano");
              expect(obj.realm).to.equal("Normal");
              expect(obj.username).to.equal("teste");
              expect(obj.email).to.equal("teste@teste.com");
              expect(obj.emailVerified).to.equal(true);
              done();
            }
          );
        }
      );
    });

    it("Deveria retornar status 200 o Usuário cadastrado nos testes", done => {
      request.post(
        {
          headers: {
            "content-type": "application/json"
          },
          url: `${baseUrl}/Usuarios/login`,
          body: JSON.stringify({
            username: updateTest.username,
            password: updateTest.password
          })
        },
        (error, response, body) => {
          const obj = JSON.parse(response.body);
          updateTest["id"] = obj.id;
          request.get(
            {
              headers: {
                "content-type": "application/json",
                Accept: "application/json"
              },
              url: `${baseUrl}/Usuarios/${obj.userId}?access_token=${obj.id}`
            },
            (error, responsePatch, body) => {
              const obj = JSON.parse(responsePatch.body);
              expect(responsePatch.statusCode).to.equal(200);
              expect(obj.nome).to.equal("Nome do fulano");
              expect(obj.realm).to.equal("Normal");
              expect(obj.username).to.equal("teste");
              expect(obj.email).to.equal("teste@teste.com");
              expect(obj.emailVerified).to.equal(true);
              done();
            }
          );
        }
      );
    });

    it("Deveria retornar status 200 e count 1 ao remover um Usuário", done => {
      request.post(
        {
          headers: {
            "content-type": "application/json"
          },
          url: `${baseUrl}/Usuarios/login`,
          body: JSON.stringify({
            username: updateTest.username,
            password: updateTest.password
          })
        },
        (error, response, body) => {
          const obj = JSON.parse(response.body);
          request.delete(
            {
              headers: {
                "content-type": "application/json",
                Accept: "application/json"
              },
              url: `${baseUrl}/Usuarios/${obj.userId}?access_token=${obj.id}`,
              body: JSON.stringify(updateTest)
            },
            (error, responsePatch, body) => {
              const obj = JSON.parse(responsePatch.body);
              expect(responsePatch.statusCode).to.equal(200);
              expect(obj.count).to.equal(1);
              done();
            }
          );
        }
      );
    });
  });

  describe("Testes de duplicação e integridade de dados", () => {
    it("Não é permitido deletar um Usuário sem se identificar", done => {
      request.delete(
        {
          headers: {
            "content-type": "application/json",
            Accept: "application/json"
          },
          url: `${baseUrl}/Usuarios/${updateTest.id}`
        },
        (error, responsePatch, body) => {
          const obj = JSON.parse(responsePatch.body);
          expect(responsePatch.statusCode).to.equal(200);
          done();
        }
      );
    });

    it("Não é permitido atualizar atributos de um Usuário sem se identificar", done => {
      request.patch(
        {
          headers: {
            "content-type": "application/json",
            Accept: "application/json"
          },
          url: `${baseUrl}/Usuarios/${updateTest.id}`,
          body: JSON.stringify(updateTest)
        },
        (error, responsePatch, body) => {
          const obj = JSON.parse(responsePatch.body);
          expect(responsePatch.statusCode).to.equal(404);
          done();
        }
      );
    });

    it("Deveria retornar 200 caso a função passada no cadastro não exista", done => {
      request.post(
        {
          headers: { "content-type": "application/json" },
          url: `${baseUrl}/Usuarios`,
          body: JSON.stringify(roleTest)
        },
        (error, response, body) => {
          const obj = JSON.parse(response.body);
          expect(response.statusCode).to.equal(200);
          done();
        }
      );
    });

    it("Deveria retornar status 422 e a mensagem 'Email inválido' ao tentar cadastrar um email inválido", done => {
      request.post(
        {
          headers: { "content-type": "application/json" },
          url: `${baseUrl}/Usuarios`,
          body: JSON.stringify(emailInvalidoTest)
        },
        (error, response, body) => {
          const obj = JSON.parse(response.body);

          expect(response.statusCode).to.equal(422);
          done();
        }
      );
    });
  });

  describe("Testes gerais", () => {
    it("Deveria retornar status 200, chave de acesso à plataforma e id do usuário ao fazer login", done => {
      request.post(
        {
          headers: { "content-type": "application/json" },
          url: `${baseUrl}/Usuarios`,
          body: JSON.stringify(updateTest)
        },
        () => {
          request.post(
            {
              headers: {
                "content-type": "application/json"
              },
              url: `${baseUrl}/Usuarios/login`,
              body: JSON.stringify({
                username: updateTest.username,
                password: updateTest.password
              })
            },
            (error, response, body) => {
              const obj = JSON.parse(response.body);
              updateTest["id"] = obj.id;
              expect(response.statusCode).to.equal(200);
              expect(obj.id).to.exist;
              expect(obj.id).to.equal(updateTest.id);
              done();
            }
          );
        }
      );
    });

    it("Deveria retornar 401 ao deslogar da plataforma sem a chave de acesso", done => {
      request.post(
        {
          headers: {
            "content-type": "application/json",
            Accept: "application/json"
          },
          url: `${baseUrl}/Usuarios/logout`
        },
        (error, responseLogout, bodyLogout) => {
          expect(responseLogout.statusCode).to.equal(401);
          done();
        }
      );
    });
  });
});
