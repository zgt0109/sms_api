### 短信发送验证接口
#### 1.发送验证码
|请求地址|http://sms.bianfu360.cn/bianfu-sms-api/send_sms|
| :-------- | :--: |
|请求方式|post|
|返回数据类型|json|

####请求参数
| 参数名     |  数据类型| 是否必选 | 备注 |
| :-------- | -------:| ------:|:--: |
| mobile    | string     | true  |手机号|

####返回参数
| 参数名     |  数据类型| 备注 |
| :-------- | -------:|:--: |
|msg|string|提示信息|
|code|string|状态码|
|data|string|返回数据|

####2.验证验证码
|请求地址|http://sms.bianfu360.cn/bianfu-sms-api/validate|
| :-------- | :--: |
|请求方式|post|
|返回数据类型|json|

#####请求参数
| 参数名     |  数据类型| 是否必选 | 备注 |
| :-------- | -------:| ------:|:--: |
| mobile    | string   |  true  |手机号|
|code|string|true|验证码|
#####返回参数
| 参数名     |  数据类型| 备注 |
| :-------- | -------:| :--: |
| msg   | string    |提示信息|
|code|string|状态码|
|data|string|返回数据|