import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';

describe('GET /', () => {
  it('should return a message', async () => {
    // Create a new instance of the mock adapter
    const mock = new MockAdapter(axios);

    // Mock the GET request
    mock.onGet('/').reply(200, { message: 'Hello API' });

    // Your test code
    const res = await axios.get(`/`);

    expect(res.status).toBe(200);
    expect(res.data).toEqual({ message: 'Hello API' });

    // Clean up the mock after the test
    mock.restore();
  });
});






