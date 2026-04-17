# Preset Instructions

## SQLAlchemy URL
```
snowflake://preset@ecsawov-pk90532/AIRBNB?role=REPORTER&warehouse=COMPUTE_WH
```

## Security JSON
```json
{
    "auth_method": "keypair",
    "auth_params": {
        "privatekey_body": "-----BEGIN ENCRYPTED PRIVATE KEY-----\nMIIFNTBfBgkqhkiG9w0BBQ0wUjAxBgkqhkiG9w0BBQwwJAQQKK4cpd+vJT6X5LWH\nNGOwJwICCAAwDAYIKoZIhvcNAgkFADAdBglghkgBZQMEASoEEFq3K2w+iDJoxu4I\nSLqusmYEggTQY/G5qoaXLlDi7dVMH51EFOqu+0rzV0WGvS1ARZL8rUlZuJfo4zRe\nOmVs5+eVcz+Sr83F+YhkIIMOvEhBwqBO9oizaRdKOVK/UcCX2cmFo/InEh6ASik0\n58AJG9r/RoNETRttDatD/GVNM45U3Cgeqvjvs8XnPQLcuZjWO9FKvlP4mpR4/3Qy\n+sCkj/TkHOU/e8QYq7w9EJi0Mz4lUMYsqjLZLnwSFedEnTgiTinJulndxViOisrv\n4LKkp1FODb+pUHdhYJDFo1hz9il2WK1actLWXdefUAPxLpCVJ0Vpn6BIzWiUtzc6\n/+qdddHdTBJus/0R8R5DDKX/v9w/Oxm/zmscmGvJYgY9Sx1lH9sjKk+6HadA4dt5\nPLpW8OLg5NHOd0aD7kbu6n8eWlF+YaudE0bVlvJqSwj0OvTw6I2Cj89ylkhnNDRv\nmdIPCeJoQhBHYpEFgrEW3qIKoP30IJ+kEHw+bv/JkbDSC+IEQiwHvOzmQr/yA3mn\nLIzdSqvu1KiimZhvK/wOtkKFgxlOxii4AzBwtgK51xr7gujUOSsZnzxoALB4SGrq\n1r/1IUkhzCDJQ/UTqq9SF6as3RdyHAEIpxNlXKip2RhAYwVX6uMA595lF0ArwdVP\n4fXpZpebeQSJhd3DgyIglF+QcCoQdWZhODIAqSffyxl7md/X9Rf8MBWeXrSPhJ4X\n74h5dy0M5m1nJvsQzRSxF2ujTf2KEdA40Rx94iNsW3104QhlRqwr4/kHuSx8zot5\nnTBpbizcFJeHVnpuFpW5g1Dk2n8gGnaPDTscCGYy+aJxyFoVmNFgoIluZpfhjquv\nLVqZs9NypIg4i4yIya5rXPCK9SN6YNM67c21tCV9R13wTEnoZeOxg3Slx3Zw7BT4\nTc8EOr6HiVbmP3JQn35Sn3p9GjYiNp1eg1MW3r7rMv443XNZypBy4TVmPNBRI0Jo\n7EXN2PVUjYx3k+GJNEA2rAIh/YGfLyLkLrth+zWwhDatXPg+3QsniovZwIW65vGv\ntN9XvV1JzCWDDn4Zh2dhmo9/QeqvZ/tosZSQnZBCRpUoyLeAluQQoiLjKkTr+hLi\nKhP/uhKXurJOVP3zwSZYDWuPiCkAvSxjI/mpU6pJCzTdCtx/tSgA7HjoLgW3DTwK\n02H2BKNIsgfuK9wUROe6AzKbysNKiunYu4K/V7hwAVbpx+CcbRQndRSabwXvFw9f\nfdwFf6m4YwrRM/Qe4gItEFMMU5LVEA7RI5UhtXvCfNQ+fXIqvBiuLVlRp6+mqOo7\nvPLqll7x33O21R6idE2FaIzXdDByDZYB6WhczIcjVT8vY0t2EP0jIKrit0yoawuA\nTyeHwFDCUqgAuAWGyrfNdlhHnA884CFptwhmC5qvbgQVBGht31uTZEDXeCgdfLxq\nOE3HQM2FJ7L7MK8AgwEBw/co7mGOvxQdh8Vr6vbQqA6jOWBvDKakfGjvOTwPdWkE\nNIJUYP9FyldwUN9U24DEzLKwbNtuPXQE4qSzjmQ3wEIBdiydMLHkQbfwsN8BMFYi\noERQxlexHCST2pVq3EQ9tbpLNXyQNIP5KGr86Ig9wvvEg6DQpPP7Ha5bDL8ymSC0\ngLEiedztxYjGXPDOHvHs+vdwoOvaG4YWuqwb0dU1CyEr7OIlfgVIyf8=\n-----END ENCRYPTED PRIVATE KEY-----\n",
        "privatekey_pass": "q"
    }
}
```

## Instructions
1. Use the SQLAlchemy URL above to connect to your Snowflake database
2. Use the Security JSON configuration for authentication
3. The private key is already formatted with escaped newlines for direct use
