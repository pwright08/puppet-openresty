local cjson = require("cjson");

local geoserver_token = {}

function geoserver_token.check_token(accessToken, geoToken)

    local acceptEncodingHeaderTemp = ngx.req.get_headers()["Accept-Encoding"]
    ngx.req.clear_header("Accept-Encoding")

    local geoserverState = ngx.location.capture('/api/sessions/' .. accessToken .. '/state/geoserver', { method = ngx.HTTP_GET });
    
    ngx.req.set_header('Accept-Encoding', acceptEncodingHeaderTemp)

    print(ngx.INFO, 'geoserverState.status = ' .. geoserverState.status)

    if geoserverState.status ~= ngx.HTTP_OK then
        ngx.log(ngx.WARN, 'Nginx was unable to get geoserver state for '.. accessToken ..' from Sessions microservice')
        return false
    end
    
    local state_json = cjson.decode(geoserverState.body)
    
    if geoToken ~= state_json['token'] or ngx.time() > state_json['token_expiry'] then
        ngx.log(ngx.WARN, 'Geoserver token invalid for '.. accessToken)
        return false
    end
    
    return true
end

return geoserver_token
