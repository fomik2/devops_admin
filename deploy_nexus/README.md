# Deploy_nexus

#### Описание и использование

Модуль устанавливает ряд пакетов и локальный репозитарий Sonatype Nexus. 

В главном манифесте  /etc/puppetlabs/code/environments/production/manifests/site.pp прописать:

```puppet
node 'nexus' {
  class { '::deploy_nexus': }
}
```
################
