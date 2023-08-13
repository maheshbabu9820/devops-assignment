import axios from 'axios';

// Mock Axios
jest.mock('axios');

describe('GET /', () => {
  it('should return a message', async () => {
    // Mock the Axios GET request
    axios.get.mockResolvedValue({
      status: 200,
      data: { message: 'Hello API' }
    });

    // Your test code
    const res = await axios.get(`/`);

    expect(res.status).toBe(200);
    expect(res.data).toEqual({ message: 'Hello API' });
  });
});





