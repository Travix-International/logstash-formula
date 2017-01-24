# logstash-formula

Install and configure Logstash on Ubuntu systems using pillar data.

Logstash requires Java, either the Oracle implementation or OpenJDK. Since that is outside the scope of this formula, you must ensure that Java is installed before applying this formula.


Available states
================
.. contents::
    :local:

``install``
------------
Install the ``logstash`` package.

``repository``
--------------
Configure the upstream ``logstash`` repository.

``configure``
-------------
Set up the configuration files.

``plugins``
-----------
Install optional plugins.

``service``
-----------
Enable and start the ``logstash`` service.

Usage
=====
See pillar.example for an example configuration.

Testing
=======
Optionally install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```
brew install cask
brew cask install vagrant
```

```
cd <formula dir>
bundle install
```
or
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

Run a converge on the default configuration:
```
kitchen converge default
```
