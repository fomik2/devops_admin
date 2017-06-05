# Deploy

#### Table of Contents

модуль устанавливает ряд системных пакетов, устанавливает Apache Maven и делает деплой на локальный
репозиратий Sonatype Nexus

Использование: в главном манифесте /etc/puppetlabs/code/environments/production/manifests/site.p включаем модуль и 
прописываем параметры: папку rsync, в которой находится pom.xml и путь к settings.xml 
```puppet
node 'test', 'vagrant_box_work' {
  class{ '::deploy':
    cwd           => '/vagrant',                  # Where Pom.xml is located on VM (RSync folder)
    settings_path => '/vagrant/settings.xml', # Where settings.xml is located on VM (RSync folder)
  }
}
```

## Описание

Модуль устанавливает Developer Tools и ряд других пакетов, необходимых для работы Apache Maven, далее пакует
исходники с github, описанные в pom.xml, пакует их в RPM и деплоит этот rpm на локальный репохитарий Nexus. 
Путь к исходникам, адреса локального репозитария и пароли прописаны в pom.xml и settings.xml
