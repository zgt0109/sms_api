###短信发送验证接口
####1.发送验证码
|请求地址|http://localhost/bianfu-sms-api/send_sms|
| :-------- | :--: |
|请求方式|post|
|返回数据类型|json|

####请求参数
| 参数名     |  数据类型| 是否必选 | 备注 |
| :-------- | -------:| ------:|:--: |
| mobile    | int     |  true  |手机号|

####返回参数
| 参数名     |  数据类型| 是否必选 | 备注 |
| :-------- | -------:| ------:|:--: |
| msg   | string     |  false  |提示信息|
|status|string|false|状态码|
|data|string|true|验证码|

####2.验证验证码
|请求地址|http://localhost/bianfu-sms-api/validata|
| :-------- | :--: |
|请求方式|post|
|返回数据类型|json|

#####请求参数
| 参数名     |  数据类型| 是否必选 | 备注 |
| :-------- | -------:| ------:|:--: |
| mobile    | int     |  true  |手机号|
|code|string|true|验证码|
#####返回参数
| 参数名     |  数据类型| 是否必选 | 备注 |
| :-------- | -------:| ------:|:--: |
| msg   | string     |  false  |提示信息|
|status|string|false|状态码|
|data|string|true|验证码|