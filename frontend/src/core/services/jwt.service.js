const ID_TOKEN_KEY = "id_token";
const USER_TYPE = "user_type";

export const getToken = () => {
    return window.localStorage.getItem(ID_TOKEN_KEY);
};

export const getUserType = () => {
    return window.localStorage.getItem(USER_TYPE);
};

export const saveToken = token => {
    window.localStorage.setItem(ID_TOKEN_KEY, token);
};

export const saveUserType = type => {
    window.localStorage.setItem(USER_TYPE, type);
};

export const destroyToken = () => {
    window.localStorage.removeItem(ID_TOKEN_KEY);
};

export const destroyUserType = () => {
    window.localStorage.removeItem(USER_TYPE);
};

export default {getToken, saveToken, destroyToken, getUserType, saveUserType, destroyUserType};