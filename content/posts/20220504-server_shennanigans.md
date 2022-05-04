---
title: "Server Shennanigans"
date: 2022-05-04T13:00:00+01:00
draft: false
tags: [boltcutter, mastodon, ansible, elastic, kibana, fluentd]
---

Wowee, this was a busy weekend and some. I reinstalled my dedicated server with no backups, set out to do everything the right way - or as close to it as possible.

As I mentioned in my [last post](https://brvy.space/posts/20220502-boltcutter_network), I fucked up my [Mastodon](https://joinmastodon.org) instance pretty badly. Due to this and my inability to fix it I got really frustrated and the next day I decided to just roll with the punches and reinstall the whole server. I've had this server for a few years now. I could - and to be honest, should've - drop the contract and rent one with better specs for the same price, but for whatever reason I feel uncomfortable doing it. Anyway, the last time I wiped it was about 4 years ago. There were a lot of outdated packages, things that were broken but not critical so I didn't do anything about them and of course the Mastodon instance that hasn't been updated in 2 years.

Mind you, the biggest obstacle was the latter, so when it died and I failed to resuscitate I really had no cons of reinstalling everything. I had nothing I used or needed a backup of and my git repositories were migrated to [Github](https://github.com/alfreddobradi) - at least the most important ones.

With that in my brain, I woke up with a determination that day to just do it before I change my mind and I did. I pressed the button to request a fresh CentOS 8 installation. There was no going back. I took my laptop from the office and went to the sitting room: perfect time to watch baseball while I'm waiting for the confirmation about the installation finishing.

It took a bit longer than I expected but I wasn't in a hurry, it was a clammy Monday and I had no work, I also hadn't decided on what configuration management tool I should use. I have some experience with [Puppet](https://puppet.com) but I'm not a big fan of how the config files work (*khm, Ruby*). The same goes against [Chef](https://chef.io), also the fact that I've never used it before. I wanted something solid yet super simple. [Ansible](https://ansible.com) it is. No agents, no installation just running YAML based playbooks. It's also maintained by RedHat so in theory should play well with CentOS.

With that out of the way came the actual work, which was breezier than I initially feared: Installed common packages, managed to get Docker to work (that was a bit of a hassle, Docker has a full repo list in their docs so I had to pick one of those but I missed that first and took a while to cop on), even used Ansible to create the Docker files and the configuration for Mastodon, [Elastic](https://www.elastic.co/elasticsearch/), [Kibana](https://www.elastic.co/kibana/) and [FluentD](https://www.fluentd.org/) (also a bit of an adventure, but this was due to me missing a config key in the docs), albeit decided to not use Ansible to manage the Docker instances, rather do it manually. I'm scared of technology, what can you do.

While I was on a roll, I also created a new Hugo blog, put it on Github and created a Github Action that deploys it to the server.

So all in all, very very fun two days, don't know when was the last time I got to do this sort of stuff but I really enjoyed it. I reckon I'll get to do it when I finally decide to get a new dedicated server, but that's a ways to go I feel.