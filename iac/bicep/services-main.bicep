param location1 string = 'koreacentral'

param location2 string = 'koreasouth'

module stgRedis1 'services/redis-template.bicep' = {
  name: 'create-redis1'
  params: {
    gLocation: location1
    redis_name: 'redis-krc-001'
  }
}

module stgRedis2 'services/redis-template.bicep' = {
  name: 'create-redis2'
  params: {
    gLocation: location2
    redis_name: 'redis-krs-001'
  }
}