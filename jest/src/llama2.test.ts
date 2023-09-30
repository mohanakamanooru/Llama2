import * as request from 'supertest'

const postUrl = 'https://api.replicate.com'
// const getUrl = `https://api.replicate.com/v1/predictions/${token}`
const API_TOKEN = 'Token r8_48ryRqdeWQ2mEekEBiuLUgcZP9tkxG029SsA6'

describe('Test llama2 from api replicate endpoint', () => {

  it('POST /predictions 201', async () => {
    const response = await request(postUrl)
      .post('/v1/predictions')
      .send({
        version: "02e509c789964a7ea8736978a43525956ef40397be9033abf9fd2badfe68c9e3",
        input: { prompt: "Hi"}
      })
      .set({
        'Content-Type': 'application/json',
        Authorization: `Bearer ${ API_TOKEN }`,
      });
    expect(response.status).toBe(201);
  });


});
