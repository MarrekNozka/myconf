#!/bin/zsh
# Soubor:  ipython-wrapper.zsh
# Datum:   10.03.2012 20:55
# Autor:   Marek Nožka, marek <@T> tlapicka <dot> net
# Licence: GNU/GPL 
############################################################
setopt re_match_pcre

if [[ $0 =~ 2 ]]; then
    ipython=ipython
elif [[ $0 =~ 3 ]]; then
    ipython=ipython3
else
    ipython=ipython3
fi

locate=$($ipython locate)
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

#TRAPINT() {
#    print 'ahoj'
#    exit 22
#}

for i in $@; do
    if [[ $i == '-h' ]]; then 
        cat <<EOF

    py           -- IPython whith PyLab ( X kernel )
    py.c         -- IPython whith PyLab ( X kernel ) clasic prompt
    pysh         -- IPython whith PySh
    py.black     -- IPython Qt black console ( X kernel )
    py.white     -- IPython Qt white console ( X kernel )
    py.notebook  -- IPython notebook kernel
    py.kernel    -- new X kernel

    OPTIONS

        new      
                run new independent kernel

        kernel-28451.json
                run comcrete existing kernel

        [ gtk | qt | tk | inline ]  new kernel; set backend

EOF
        exit;
    fi

done

name=$(basename $0)
font='--ConsoleWidget.font_family="Terminus" --ConsoleWidget.font_size=18'

# pokud není zadán parametr hledá se existující kernel
# pokud je zadán nastaví se podlen něj backend
#
if [ -z $1 ] ; then
    kernel=$(egrep '\-\-existing' $locate/pyXkernel | head -n 1 | cut -d ' ' -f 2-)
elif [[ $1 == 'new' ]]; then
    pylab='--pylab=qt --quiet'
elif [[ $1 == 'gtk' ]]; then
    pylab='--pylab=gtk'
elif [[ $1 == 'tk' ]]; then
    pylab='--pylab=tk'
elif [[ $1 == 'qt' ]]; then
    pylab='--pylab=qt'
elif [[ $1 == 'inline' ]]; then
    pylab='--pylab=inline'
elif [[ $1 =~ '\.json$' ]]; then
    kernel="--existing $1"
fi

#podle jména se spustí rozhranní
#
if [[ $name =~ 'py[23]?\.c$' ]]; then
    eval $ipython console $pylab --classic $kernel
elif [[ $name =~ 'py[23]?$' ]]; then
    eval $ipython console $pylab $kernel
elif [[ $name =~ 'py[23]?sh$' ]]; then
    $ipython --profile=pysh $pylab
elif [[ $name =~ 'py[23]?.black$' ]]; then
    eval $ipython qtconsole $pylab --colors=linux --gui-completion ncurses $font $kernel
elif [[ $name =~ 'py[23]?.white$' ]]; then
    eval $ipython qtconsole $pylab --colors=lightbg --gui-completion ncurses $font $kernel
elif [[ $name =~ 'py[23]?.notebook$' ]]; then
    eval $ipython notebook --profile=notebook --pylab=inline
elif [[ $name =~ 'py.kernel' ]]; then
    exec $ipython kernel ${pylab---pylab=qt} 2>&1  | tee $locate/pyXkernel 
else
    echo ladění: __${0}__
fi

