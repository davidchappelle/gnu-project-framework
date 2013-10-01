+ cpp-project-framework

This is a project skeleton that can be used to quickly get up and running with a c++ based project without having to fight through all of the initial gnu make overhead.

+ Unit Testing

cxxtest is integrated with this project. To install cxxtest in your development
environment you first need to download the cxxtest tarball which you can find at
the following site:

    http://sourceforge.net/projects/cxxtest/files/cxxtest/

Extract the tarball and install:

    $ gunzip cxxtest-<version>.tar.gz
    $ tar xf cxxtest-<version>.tar
    $ cd cxxtest-<version>/python
    $ python setup.py install

You should now be able to build your projects unit tests:

    $ make test

