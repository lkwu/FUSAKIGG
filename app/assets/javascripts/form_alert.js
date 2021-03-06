$(document).ready(function () {
    $('.ui.dropdown').dropdown();
    $('.ui.form').form({
        on: 'blur',
        inline : true,
        fields: {
            order_name: {
                identifier: 'order_name',
                rules: [{type   : 'empty', prompt : '請輸入名字'}]
            },
            order_address: {
                identifier: 'order_address',
                rules: [{type   : 'empty', prompt : '請輸入地址'}]
            },
            district: {
                identifier: 'district',
                rules: [{type   : 'empty', prompt : '請選擇區鎮鄉'}]
            },
            county: {
                identifier: 'county',
                rules: [{type   : 'empty', prompt : '請選擇縣市'}]
            },
            postcode: {
                identifier: 'postcode',
                rules: [{type   : 'empty', prompt : '請選擇區鎮鄉'}]
            },
            order_email: {
                identifier: 'order_email',
                rules: [{type   : 'email', prompt : '請輸入Email'}]
            },
            order_phone: {
                identifier: 'order_phone',
                rules: [{type   : 'empty', prompt : '請輸入電話'},
                    {type   : 'number', prompt : '請輸入數字'},
                    {type   : 'minLength[9]', prompt : '請輸入至少9位數'}]
            },
            return_order_phone: {
                identifier: 'return_order_phone',
                rules: [{type   : 'empty', prompt : '請輸入電話'},
                    {type   : 'number', prompt : '請輸入數字'},
                    {type   : 'minLength[9]', prompt : '請輸入至少9位數'}]
            },
            return_order_ps: {
                identifier: 'return_order_ps',
                rules: [{type   : 'empty', prompt : '請至少打20個說明字'},
                    {type   : 'minLength[20]', prompt : '請至少打20個說明字'}]
            },
            user_current_password: {
                identifier: 'user_current_password',
                rules: [{type   : 'empty', prompt : '請輸入舊密碼'},
                    {type   : 'minLength[8]', prompt : '請至少輸入8位密碼'}]
            },
            user_password: {
                identifier: 'user_password',
                rules: [{type   : 'empty', prompt : '請輸入密碼'},
                    {type   : 'minLength[8]', prompt : '請至少輸入8位密碼'}]
            },
            user_password_confirmation: {
                identifier: 'user_password_confirmation',
                rules: [{type   : 'empty' , prompt : '請輸入密碼確認'},
                    {type   : 'minLength[8]', prompt : '請至少輸入8位密碼'}]
            }
        }
    });

})