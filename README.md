# Installing the latest version of python3

## 1. Know which shell you are using

For our cluster, your shell may be either bash or tcsh. To check which you are using, run:

```bash
echo $SHELL
```

## 2. Check that your $HOME is shared across the cluster

Run:

```bash
echo $HOME
```

If the result does not begin with `/net/`, [follow the instructions for "dealing with HOME not on /net/" below](#dealing-with-home-not-on-net] before continuing.

## 3. Choose between Miniconda and Linuxbrew

Miniconda is a bit simpler, so we recommend it.  Linuxbrew helps with installing the latest versions of any other packages you might need, and is also quite easy to use.  Continue to [instructions for Miniconda](#miniconda) or [instructions for Linuxbrew](#linuxbrew).

## Miniconda

[Miniconda](https://conda.io/miniconda.html) is a lightweight version of
Anaconda that installs just python and the conda package manager. It is
available for all platforms (Windows, Mac, and Linux).

### Installing

Download the latest [64-bit Linux installer for python3](https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh)
and then follow the [quick install](https://conda.io/docs/install/quick.html#linux-miniconda-install).

- If you are using bash, the installer should offer to change your $PATH automatically.

- If you are using tcsh, add the following to your `.cshrc`:

    ```bash
    setenv PATH "/net/<machine>/home/<user>/miniconda3/bin:${PATH}"
    ```

    Then run `source $HOME/.cshrc` or logout and log back in.

By default, Miniconda makes `python` refer to `python3`.  This can break legacy programs.
We recommend that you run `rm ~/miniconda3/bin/python` so that `python` will still refer to `python2`.
If you want python3, run `python3`.

### Packages

You can install python packages using `conda` or `pip3` now. For example:

```bash
conda install numpy pandas
```

## Linuxbrew

[Linuxbrew](http://linuxbrew.sh/) not only allows you to install a
recent version of python, it allows you to compile and install many
other programs and libraries. You can install a recent version of tmux,
git, gpg, R, pretty much anything.

Linuxbrew compiles from source, and as such it can take some
time to install various programs depending on how many dependencies they
have.

You may encounter issues having both linuxbrew and miniconda on your
$PATH simultaneously.

### Installing linuxbrew

Follow the [installation
instructions](http://linuxbrew.sh/#install-linuxbrew) to get started.

- If you are using <span style='color: darkorange'>bash</span>, linuxbrew can automatically set your PATH
correctly by adding the proper command to your `.bashrc` file.

- If you are using <span style='color: #663399'>tcsh</span>, you will need to set your PATH by adding the
following to your `.cshrc` in your $HOME:

    ```bash
    setenv PATH "/net/<machine>/home/<user>/.linuxbrew/bin:${PATH}"
    ```

### Installing python

Now you should be able to run the following:

```bash
brew install python3
```

This should take a little while because brew compiles everything from scratch.

### Packages

Now you can install python3 packages with pip3, which was included when
you installed python3. For example:

```bash
pip3 install pandas numpy scipy statsmodels cython numba
```

You don't need `sudo` or `--user` since your python3 is installed under
linuxbrew in your home directory.

<br>

<br>

---

## more instructions

### dealing with HOME not on /net/

If the result of 

```bash
echo $HOME
```

does not begin with `/net/`, you will have trouble running your newly 
installed python3 on the nodes on the cluster. It will still work fine 
on the machine where you install it, but we recommend against it.

For folks whose home directories do not automatically include
`/net/...`, you should ensure that you are sitting in your home
directory, and that it is prefixed by `/net/<machine>/...`, and that
your `$HOME` is also set to that directory. This makes life much easier
when working with the cluster - your binaries compiled by miniconda and linuxbrew will
work everywhere this way.

To make this always the case:

- If `echo $SHELL` contains `bash`, then:

    1. Put the following at the top of your `.bashrc`: 

        ```bash
        export HOME=/net/<machine>/home/<me>
        ```

    2. And the following at the bottom of your `.bash_profile`:

        ```bash
        cd $HOME
        ```

- If `echo $SHELL` contains `tcsh`, then ask somebody for help.

Then logout and log back in. 

To modify $HOME for only your current session (ie, until you log out or disconnect), run:

- on `bash`:

    ```bash
    export HOME=/net/<machine>/home/<me>
    cd $HOME
    ```

- on `tcsh`:

    ```bash
    setenv HOME /net/<machine>/home/<me>
    cd $HOME
    ```

You will have to remember to do this before you ever do `brew install
...` or `conda install ...`, though, or else nasty problems can occur.


