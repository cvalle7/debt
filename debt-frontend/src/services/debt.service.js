import axios from 'axios';

const BACK_URL = process.env.VUE_APP_BACKEND_URL

const getAllDebt = async () => {
    try {
        const response = await axios.get(`${BACK_URL}/debt`)
        return response.data
    } catch (error) {
        throw new Error(error.message);
    }
}

const getDebt = async (id) => {
    try {
        const response = await axios.get(`${BACK_URL}/debt/find-one?id=${id}`);
        return response.data
    } catch (error) {
        throw new Error(error.message);
    }
}

const createPay = async (data) => {
    try {
        const response = await axios.post(`${BACK_URL}/pay`, {
            headers: {
                'Content-Type': 'application/json',
            }, data
        });
        return response.data
    } catch (error) {
        console.log(error);
        throw new Error(error.message);
    }
}

export default { getAllDebt, getDebt, createPay }