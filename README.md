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

If the result starts with `/home/` or `/exports/`, [follow these instructions](etc/dealing-with-home-not-on-net.md) before continuing.

## 3. Choose either Miniconda or Linuxbrew

We recommend Miniconda because it is simpler than Linuxbrew, but both are quite easy to use.

[Miniconda](https://conda.io/miniconda.html) is a lightweight version of Anaconda that installs just python and the conda package manager.
It is available for all platforms (Windows, Mac, and Linux).
To install it, continue to [instructions for Miniconda](#miniconda).

[Linuxbrew](http://linuxbrew.sh/) can install the latest version of python, 
and many other programs and libraries.
You can install the latest version of tmux, git, R, pandoc, samtools, or any of 5000 other packages.
Linuxbrew compiles from source, and as such it can take more than ten minutes to install some programs if they depend on many other packages.
To install it, continue to [instructions for Linuxbrew](#linuxbrew).

You may encounter issues having both linuxbrew and miniconda on your
$PATH simultaneously.


## Miniconda

### Installing Miniconda

(The official install instructions are [here](https://conda.io/docs/install/quick.html#linux-miniconda-install).  Below is how we recommend installing miniconda3.)

Run:

```
curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh > install-miniconda3.sh
bash install-miniconda3.sh
```

Type &lt;enter&gt; to view the terms & conditions.  When you're done with them, type "q" to close them, and then "yes" &lt;enter&gt; to accept them.

Type &lt;enter&gt; to agree to the path `~/miniconda3`.

Next,

- If you are using bash, type "yes" and &lt;enter&gt; to let have miniconda modify `$PATH` in your `~/.bash_profile` or `~/.bashrc`.

- If you are using tcsh, add the following to your `.cshrc`:

  ```bash
  setenv PATH "/net/<machine>/home/<user>/miniconda3/bin:${PATH}"
  ```

Miniconda3 makes `python` an alias for `python3` and `pip` an alias for `pip3`.
The developers of python [recommend against that behavior](https://www.python.org/dev/peps/pep-0394/), because many scripts expect `python` to refer to `python2` and will break otherwise.
To make `python` and `pip` refer to `python2` and `pip2` (like they do without miniconda3 installed), I recommend running:

```bash
rm ~/miniconda3/bin/python
rm ~/miniconda3/bin/pip
```

### Packages

You can install python packages using `conda` or `pip3` now. For example:

```bash
pip3 install numpy pandas
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
