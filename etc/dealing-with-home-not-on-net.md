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

    You will have to remember to do this each time you log in before you running `brew install ...` or `conda install ...`, though, or else nasty problems can occur.
