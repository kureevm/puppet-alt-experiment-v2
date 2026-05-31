# Puppet ALT experiment v2

Эксперимент по адаптации Puppet-модуля для ALT Workstation 10.4.

## Стенд
- ALT Workstation 10.4 x86_64
- Puppet 7.20.0
- Facter 4.5.1
- Oracle VirtualBox

## Запуск
```bash
FACTERLIB=/root/puppet-alt/modules/alt_adapted/lib/facter         puppet apply /root/puppet-alt/manifests/site.pp         --modulepath=/root/puppet-alt/modules --show_diff --summarize
```

