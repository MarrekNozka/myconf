#!/bin/zsh
# Soubor:  ipython-wrapper.zsh
# Datum:   10.03.2012 20:55
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
############################################################
#
# %config InlineBackend.figure_format = 'svg'
# %loadpy http://matplotlib.sourceforge.net/plot_directive/mpl_examples/mplot3d/contour3d_demo.py
# 
#In [5]: plot(range(5)) # plots in the matplotlib window
#
#In [6]: display(gcf()) # embeds the current figure in the qtconsole
#
#In [7]: display(*getfigs()) # embeds all active figures in the qtconsole
#
#
#%config InlineBackend.close_figures=False
#gcf(), gca(), getfigs()
#

for i in $@; do
    if [[ $i == '-h' ]]; then 
        cat <<EOF

    py           -- IPython whith PyLab ( X kernel )
    py.c         -- IPython whith PyLab ( X kernel ) clasic prompt
    pysh         -- IPython whith PySh
    py.black     -- IPython Qt black console ( X kernel )
    py.white     -- IPython Qt white console ( X kernel )
    py.inline    -- IPython inline white console ( X kernel )
    py.notebook  -- IPython notebook kernel
    py.kernel    -- new X kernel

    OPTIONS

        -e      
                run new independent kernel

        kernel-28451.json
                run comcrete existing kernel

EOF
        exit;
    fi

done

name=$(basename $0)
font='--ConsoleWidget.font_family="Terminus" --ConsoleWidget.font_size=15'

if [ -z $1 ] ; then
    kernel=$(egrep '\-\-existing' ~/.config/ipython/pyXkernel | head -n 1 | cut -d ' ' -f 2,3)
elif [[ $1 == '-e' ]]; then
    kernel=""
elif [ $1 ]; then
    kernel="--existing $1"
fi

if [[ $name == 'py.c' ]]; then
    eval ipython console --pylab=qt --classic $kernel
elif [[ $name == 'py' ]]; then
    eval ipython console --pylab=qt $kernel
elif [[ $name == 'pysh' ]]; then
    ipython --profile=pysh --pylab=qt 
elif [[ $name == 'py.black' ]]; then
    eval ipython qtconsole --pylab=qt --colors=linux --gui-completion ncurses $font $kernel
elif [[ $name == 'py.white' ]]; then
    eval ipython qtconsole --pylab=qt --colors=lightbg --gui-completion ncurses $font $kernel
elif [[ $name == 'py.inline' ]]; then
    eval ipython qtconsole --pylab=inline --colors=lightbg --gui-completion ncurses $font $kernel
elif [[ $name == 'py.notebook' ]]; then
    eval ipython notebook --profile=notebook 
elif [[ $name == 'py.kernel' ]]; then
    eval ipython kernel --pylab=qt 2>~/.config/ipython/pyXkernel &
fi
