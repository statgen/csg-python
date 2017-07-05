# Installing the latest version of python3

## Know which shell you are using

For our cluster, you may be using either <span style='color: darkorange'>bash</span> or <span style='color: #663399'>tcsh</span> shell. To check
which you are using, do: 

```bash
echo $SHELL
```

## Before installing either linuxbrew or miniconda

Quickly do: 

```bash
echo $HOME
```

If it begins with `/net/...`, <span style='color: red'>then you can skip
the rest of this section.</span> Most people should fall into this camp. 

For folks whose home directories do not automatically include
`/net/...`, you should ensure that you are sitting in your home
directory, and that it is prefixed by `/net/<machine>/...`, and that
your `$HOME` is also set to that directory. This makes life much easier
when working with the cluster - your linuxbrew compiled binaries will
work everywhere this way.

To make this always the case: 

1. Put the following at the top of your `.bashrc`: 

    ```bash
    export HOME=/net/<machine>/home/<me>
    ```

2. And the following at the bottom of your `.bash_profile`:

    ```bash
    cd $HOME
    ```

Then logout/back in. 

To temporarily do this, just do: 

```bash
export HOME=/net/<machine>/home/<me>
cd $HOME
```

You will have to remember to do this before you ever do `brew install
...`, though. 

## Miniconda (recommended)

[Miniconda](https://conda.io/miniconda.html) is a lightweight version of
Anaconda that installs just python and the conda package manager. It is
available for all platforms (Win, Mac, and Linux.)

### Installing

Download the latest [64-bit Linux
installer for python 3](https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh)
and then follow the [quick
install](https://conda.io/docs/install/quick.html#linux-miniconda-install). 

The installer should offer to change your PATH automatically if you are
using <span style='color: darkorange'>bash</span>.

If you are using <span style='color: #663399'>tcsh</span>, you will need
to add the following to your `.cshrc`: 

```bash
setenv PATH "/net/<machine>/home/<user>/miniconda3/bin:${PATH}"
```

Now `source $HOME/.cshrc` or logout/back in. 

### Packages

You can install python packages using `conda` or `pip3` now. For
example: 

```bash
conda install numpy pandas
```

## Linuxbrew (alternative)

[Linuxbrew](http://linuxbrew.sh/) not only allows you to install a
recent version of python, it allows you to compile and install many
other programs and libraries. You can install a recent version of tmux,
git, gpg, R, pretty much anything. 

Linuxbrew compiles from source, and as such it can take some
time to install various programs depending on how many dependencies they
have. 

You may encounter issues having both linuxbrew and miniconda on your
PATH simultaneously. 

### Installing linuxbrew

Follow the [installation
instructions](http://linuxbrew.sh/#install-linuxbrew) to get started. 

If you are using <span style='color: darkorange'>bash</span>, linuxbrew can automatically set your PATH
correctly by adding the proper command to your `.bashrc` file. 

If you are using <span style='color: #663399'>tcsh</span>, you will need to set your PATH by adding the
following to your `.cshrc` in your home: 

```bash
setenv PATH "/net/<machine>/home/<user>/.linuxbrew/bin:${PATH}"
```

### Installing python

Now you should be able to do the following (log out and back in or
`source $HOME/.bashrc` first): 

```bash
brew install python3
```

This should take a little while (brew compiles everything from scratch.) 

### Packages

Now you can install python packages with pip3, which was included when
you installed python3. For example: 

```bash
pip3 install pandas numpy scipy statsmodels cython numba
```

You don't need `sudo` or `--user` since your python3 is installed under
linuxbrew in your home directory. 

