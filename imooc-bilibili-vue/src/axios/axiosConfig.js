import axios from 'axios';

const httpRequest = axios.create({
    // 请求的后端接口的基础路径
    baseURL:'http://localhost:15005',
    // 接口超时响应时间
    timeout:10000
});


// 请求拦截器
httpRequest.interceptors.request.use(
    config => {
        const token = localStorage.getItem('token');
        const refreshToken = localStorage.getItem('refreshToken');
        
        if (token && token !== 'null' && token !== '') {
            config.headers['token'] = token;
        }
        
        if (refreshToken && refreshToken !== 'null' && refreshToken !== '') {
            config.headers['refreshToken'] = refreshToken;
        }
        
        return config;
    },
    error => {
        return Promise.reject(error);
    }
);

//响应拦截器
httpRequest.interceptors.response.use(function (response){
    const data = response.data;
    if(data){
        if(data.code === '500'){
            window.alert(data.msg);
            throw new Error(data.msg);
        }
    }
    return data;
})

export default httpRequest