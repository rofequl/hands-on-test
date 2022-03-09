const path = require("path");

module.exports = {
    lintOnSave: false,
    configureWebpack: {
        resolve: {
            alias: {
                vue$: "vue/dist/vue.runtime.esm.js",
            },
        },
    },
    devServer: {
        proxy: "http://127.0.0.1:8080/",
    },
    css: {
        loaderOptions: {
            postcss: {
                config: {
                    path: __dirname,
                },
            },
        },
    },
};