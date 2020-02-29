#说明

    这是用于下载ERA5的脚本，能够实现批量化下载功能

#依赖

    python3、cdsapi包

#使用前配置

    在https://cds.climate.copernicus.eu/注册账户，参考https://cds.climate.copernicus.eu/api-how-to的说明配置

#脚本使用方法

    sh ./down.sh DATE1 DATE2

    DATE1为开始日期

    DATE2为结束日期

    日期格式为YYMMDD

#数据保存路径

    数据下载完成后将被保存在data路径下
