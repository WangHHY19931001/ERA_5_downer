import cdsapi
c = cdsapi.Client()
c.retrieve('reanalysis-era5-complete',{
    'class':'ea',
    'date':'DATE1',
    'area':'Nort/West/Sout/East',
    'expver':'1',
    'levelist': '1/to/137',
    'levtype':'ml',
    'param':'129/130/131/132/133/152',
    'stream':'oper',
    'time':'TIME',
    'type':'an',
    'grid':"0.25/0.25",
},'ERA5-DATE1-TIME-ml.grib')

