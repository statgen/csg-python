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

If the result starts with `/net/`, you're fine.

If the result starts with `/home/` or `/exports/`, [follow the instructions for "dealing with HOME not on /net/" below](#dealing-with-home-not-on-net) before continuing.

## 3. Choose between Miniconda and Linuxbrew

We recommend Miniconda because it is simpler than Linuxbrew, but both are quite easy to use.

[Miniconda](https://conda.io/miniconda.html) is a lightweight version of Anaconda that installs just python and the conda package manager.
It is available for all platforms (Windows, Mac, and Linux).
To install it, continue to [instructions for Miniconda](#miniconda).

[Linuxbrew](http://linuxbrew.sh/) not only allows you to install a
recent version of python, it allows you to compile and install many
other programs and libraries.
You can install the latest version of tmux, git, R, pandoc, samtools, pretty much anything.
Linuxbrew compiles from source, and as such it can take several minutes to install some programs depending on how many dependencies they have.
To install it, continue to [instructions for Linuxbrew](#linuxbrew).

You may encounter issues having both linuxbrew and miniconda on your
$PATH simultaneously.


## Miniconda

### Installing Miniconda

Download the latest [64-bit Linux installer for python3](https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh)
and then follow the [quick install](https://conda.io/docs/install/quick.html#linux-miniconda-install).
Press "q" when you're done reading the terms and conditions and then simple press &lt;enter&gt; at each prompt to accept the defaults.


- If you are using bash, the installer will change your $PATH automatically by modifying `~/.bash_profile`.

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

### Installing Linuxbrew

Follow the [installation
instructions](http://linuxbrew.sh/#install-linuxbrew) to get started.

- If you are using bash, linuxbrew can automatically set your PATH
correctly by adding the proper command to your `~/.bashrc` file.

- If you are using tcsh, you will need to set your PATH by adding the
following to your `~/.cshrc`:

    ```bash
    setenv PATH "/net/<machine>/home/<user>/.linuxbrew/bin:${PATH}"
    ```

### Installing Python3

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
on the machine where you install it.

For folks whose $HOME directories do not automatically include
`/net/...`, you should ensure that you are sitting in your home
directory, and that it is prefixed by `/net/<machine>/...`, and that
your `$HOME` is also set to that directory. This makes life much easier
when working with the cluster - your binaries compiled by miniconda and linuxbrew will
work everywhere this way.

- To permanently modify $HOME:

    - If you are using `bash`, then:

        1. Put the following at the top of your `~/.bashrc`:

            ```bash
            export HOME=/net/<machine>/home/<me>
            ```

        2. And the following at the bottom of your `~/.bash_profile`:

            ```bash
            cd $HOME
            ```

    - If you are using `tcsh`, then ask somebody for help.

    Then logout and log back in.

- To modify $HOME for only your current session (ie, until you log out or disconnect), run:

    - If you are using `bash`:

        ```bash
        export HOME=/net/<machine>/home/<me>
        cd $HOME
        ```

    - If you are using `tcsh`:

        ```bash
        setenv HOME /net/<machine>/home/<me>
        cd $HOME
        ```

    You will have to remember to do this before you ever do `brew install ...` or `conda install ...`, though, or else nasty problems can occur.


