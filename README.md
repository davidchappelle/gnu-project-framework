============================== gnu-project-framework ==============================

This is a project skeleton that can be used to quickly get up and running with
a gnu based c/c++ project without having to fight through all of the initial gnu
make overhead. The sample included in the project framework includes simple skeletons
of both a c and c++ library, unit testing for these libraries, and the corresponding
c and c++ executables that use these libraries.

================================== unit testing ===================================

cxxtest is integrated with this project. To install cxxtest in your development
environment you ihave two options:

1. From the tarball distribution.

    Download the cxxtest tarball which you can find at the following site:

        http://sourceforge.net/projects/cxxtest/files/cxxtest/

    Extract the tarball and install:

        $ gunzip cxxtest-<version>.tar.gz
        $ tar xf cxxtest-<version>.tar
        $ cd cxxtest-<version>/python
        $ python setup.py install

2. From your package management tool (i.e. apt-get).

    Install directly from your package management tool:

        $ sudo apt-get install cxxtest

You should now be able to build your projects unit tests:

    $ make test

